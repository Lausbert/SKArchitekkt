// Copyright © 2020 Stephan Lerner. All rights reserved.

import SwiftUI
import CoreArchitekkt

struct SettingsView: View {
    
    // MARK: - Internal -
    
    @Binding var document: Document
    @Binding var settingsDomains: [SettingsDomain]

    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                ForEach(settingsDomains.indices, id: \.self) { index in
                    SettingsDomainView(document: $document, settingsDomain: $settingsDomains[index])
                }
            }
        }
        Button {
            settingsDomains.indices.forEach { settingsDomainIndex in
                settingsDomains[settingsDomainIndex].settingsGroups.indices.forEach { settingsGroupIndex in
                    withAnimation {
                        settingsDomains[settingsDomainIndex].settingsGroups[settingsGroupIndex].reset()
                    }
                }
            }
        } label: {
            Text("Reset")
        }.padding()
    }
    
    // MARK: - Private -
    
    private struct SettingsDomainView: View {
        
        @Binding var document: Document
        @Binding var settingsDomain: SettingsDomain
        
        var body: some View {
            VStack(alignment: .leading, spacing: 0) {
                Text(settingsDomain.name)
                    .padding(6)
                    .font(.headline)
                    .foregroundColor(.gray)
                VStack(alignment: .leading) {
                    ForEach(settingsDomain.settingsGroups.indices, id: \.self) { index in
                        SettingsGroupView(document: $document, settingsGroup: $settingsDomain.settingsGroups[index])
                    }
                }
                Divider()
                    .padding(8)
            }
        }
    }
    
    private struct SettingsGroupView: View {
        
        @Binding var document: Document
        @Binding var settingsGroup: SettingsGroup
        
        var body: some View {
            VStack(alignment: .leading) {
                HStack {
                    if !settingsGroup.name.isEmpty {
                        Text(settingsGroup.name)
                            .font(.subheadline)
                    }
                    Spacer()
                    if let preferredNewValue = settingsGroup.preferredNewValue {
                        Button {
                            withAnimation {
                                let item = SettingsItem(name: "", value: preferredNewValue)
                                settingsGroup.add(settingsItem: item)
                            }
                        } label: {
                            Image(systemName: "plus.circle")
                        }.buttonStyle(PlainButtonStyle())
                    }
                }
                .padding(EdgeInsets(top: 6, leading: 6, bottom: 6, trailing: 16))
                if !settingsGroup.settingsItems.isEmpty {
                    ForEach(settingsGroup.settingsItems.indices, id: \.self) { index in
                        SettingsItemView(document: $document, settingsGroup: $settingsGroup, settingsItem: $settingsGroup.settingsItems[index])
                    }
                }
            }
        }
    }
    
    private struct SettingsItemView: View {
        
        @Binding var document: Document
        @Binding var settingsGroup: SettingsGroup
        @Binding var settingsItem: SettingsItem
                
        var body: some View {
            switch settingsItem.value {
            case let .range(_, minValue, maxValue):
                VStack(alignment: .leading, spacing: 0) {
                    Text(settingsItem.name)
                        .font(.subheadline).padding(6)
                    Slider(value: getRangeBinding(minValue: minValue, maxValue: maxValue), in: minValue...maxValue, onEditingChanged: { isEditing in
                        document.isEditing = isEditing
                    })
                        .padding(EdgeInsets(top: 0, leading: 16, bottom: 4, trailing: 16))
                }
            case let .deletable(virtualTransformation):
                HStack {
                    switch virtualTransformation {
                    case .unfoldNode, .hideNode, .flattenNode, .unfoldScope, .hideScope, .flattenScope:
                        Text(settingsItem.name)
                            .font(.subheadline).padding(6)
                    case .colorNode, .colorScope:
                        EmptyView()
                    case .unfoldNodes, .hideNodes, .flattenNodes, .unfoldScopes, .hideScopes, .flattenScopes:
                        TextField("Regex", text: getRegexBinding(), onEditingChanged: { isEditing in
                            document.isEditing = isEditing
                        })
                            .textFieldStyle(PlainTextFieldStyle())
                            .multilineTextAlignment(.trailing)
                            .font(.subheadline).padding(6)
                    case .colorNodes, .colorScopes:
                        EmptyView()
                    }
                    Button {
                        settingsGroup.remove(settingsItem: settingsItem)
                    } label: {
                        Image(systemName: "minus.circle")
                    }.buttonStyle(PlainButtonStyle())
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 16))
            }
        }
                
        private func getRangeBinding(minValue: Double, maxValue: Double) -> Binding<Double> {
            Binding<Double>(
                get: {
                    if case let .range(value, _, _) = settingsItem.value {
                        return value
                    } else {
                        assertionFailure()
                        return 0.0
                    }
                },
                set: {
                    settingsItem.value = SettingsValue.range(value: $0, minValue: minValue, maxValue: maxValue)
                }
            )
        }
        
        private func getRegexBinding() -> Binding<String> {
            Binding<String>(
                get: {
                    if case let .deletable(virtualTransformation) = self.settingsItem.value {
                        switch virtualTransformation {
                        case let .unfoldNodes(regex), let .hideNodes(regex), let .flattenNodes(regex), let .unfoldScopes(regex), let .hideScopes(regex), let .flattenScopes(regex):
                            return regex
                        default:
                            assertionFailure()
                            return ""
                        }
                    } else {
                        assertionFailure()
                        return ""
                    }
                },
                set: {
                    if case let .deletable(virtualTransformation) = self.settingsItem.value {
                        switch virtualTransformation {
                        case .unfoldNodes:
                            self.settingsItem.value = SettingsValue.deletable(virtualTransformation: .unfoldNodes(regex: $0))
                        case .hideNodes:
                            self.settingsItem.value = SettingsValue.deletable(virtualTransformation: .hideNodes(regex: $0))
                        case .flattenNodes:
                            self.settingsItem.value = SettingsValue.deletable(virtualTransformation: .flattenNodes(regex: $0))
                        case .unfoldScopes:
                            self.settingsItem.value = SettingsValue.deletable(virtualTransformation: .unfoldScopes(regex: $0))
                        case .hideScopes:
                            self.settingsItem.value = SettingsValue.deletable(virtualTransformation: .hideScopes(regex: $0))
                        case .flattenScopes:
                            self.settingsItem.value = SettingsValue.deletable(virtualTransformation: .flattenScopes(regex: $0))
                        default:
                            assertionFailure()
                        }
                    }
                }
            )
        }
        
    }
}
