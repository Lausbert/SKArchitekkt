// Copyright © 2020 Stephan Lerner. All rights reserved.

import SwiftUI
import CoreArchitekkt

struct SettingsView: View {
    
    // MARK: - Internal -
    
    @Binding var settingsDomains: [SettingsDomain]

    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                ForEach(settingsDomains) { settingsDomain in
                    SettingsDomainView(settingsDomain: settingsDomain)
                }
            }
        }
        Button {
            settingsDomains.flatMap( { $0.settingsGroups } ).forEach { settingsGroup in
                withAnimation {
                    settingsGroup.reset()
                }
            }
        } label: {
            Text("Reset")
        }.padding()
    }
    
    // MARK: - Private -
    
    private struct SettingsDomainView: View {
        
        let settingsDomain: SettingsDomain
        
        var body: some View {
            VStack(alignment: .leading, spacing: 0) {
                Text(settingsDomain.name)
                    .padding(6)
                    .font(.headline)
                    .foregroundColor(.gray)
                VStack(alignment: .leading) {
                    ForEach(settingsDomain.settingsGroups) { settingsGroup in
                        SettingsGroupView(settingsGroup: settingsGroup)
                    }
                }
                Divider()
                    .padding(8)
            }
        }
    }
    
    private struct SettingsGroupView: View {
        
        @ObservedObject var settingsGroup: SettingsGroup
        
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
                ForEach(settingsGroup.settingsItems) { settingsItem in
                    SettingsItemView(settingsGroup: settingsGroup, settingsItem: settingsItem)
                }
                if settingsGroup.settingsItems.isEmpty {
                    Text("Empty")
                        .frame(maxWidth: .infinity, alignment: .center)
                        .font(.footnote)
                        .foregroundColor(.gray)
                }
            }
        }
    }
    
    private struct SettingsItemView: View {
        
        let settingsGroup: SettingsGroup
        @ObservedObject var settingsItem: SettingsItem
        
        init(settingsGroup: SettingsGroup, settingsItem: SettingsItem) {
            self.settingsGroup = settingsGroup
            self.settingsItem = settingsItem
            if case let .deletable(virtualTransformation) = self.settingsItem.value {
                switch virtualTransformation {
                case let .unfoldNodes(regex), let .hideNodes(regex), let .flattenNodes(regex), let .unfoldScopes(regex), let .hideScopes(regex), let .flattenScopes(regex):
                    self.regex = regex
                default:
                    break
                }
            }
        }
                
        var body: some View {
            switch settingsItem.value {
            case let .range(_, minValue, maxValue):
                VStack(alignment: .leading, spacing: 0) {
                    Text(settingsItem.name)
                        .font(.subheadline).padding(6)
                    Slider(value: getRangeBinding(minValue: minValue, maxValue: maxValue), in: minValue...maxValue)
                        .padding(EdgeInsets(top: 0, leading: 16, bottom: 4, trailing: 16))
                }
            case let .deletable(virtualTransformation):
                HStack {
                    switch virtualTransformation {
                    case .unfoldNode, .hideNode, .flattenNode, .unfoldScope, .hideScope, .flattenScope:
                        Text(settingsItem.name)
                            .font(.subheadline).padding(6)
                    case .unfoldNodes, .hideNodes, .flattenNodes, .unfoldScopes, .hideScopes, .flattenScopes:
                        TextField("Regex", text: $regex, onCommit: {
                            updateSettingsValueWithRegex()
                        })
                            .textFieldStyle(PlainTextFieldStyle())
                            .multilineTextAlignment(.trailing)
                            .font(.subheadline).padding(6)
                    }
                    Button {
                        withAnimation {
                            settingsGroup.remove(settingsItem: settingsItem)
                        }
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
        
        @State private var regex: String = ""
        
        private func updateSettingsValueWithRegex() {
            if case let .deletable(virtualTransformation) = self.settingsItem.value {
                switch virtualTransformation {
                case .unfoldNodes:
                    self.settingsItem.value = SettingsValue.deletable(virtualTransformation: .unfoldNodes(regex: regex))
                case .hideNodes:
                    self.settingsItem.value = SettingsValue.deletable(virtualTransformation: .hideNodes(regex: regex))
                case .flattenNodes:
                    self.settingsItem.value = SettingsValue.deletable(virtualTransformation: .flattenNodes(regex: regex))
                case .unfoldScopes:
                    self.settingsItem.value = SettingsValue.deletable(virtualTransformation: .unfoldScopes(regex: regex))
                case .hideScopes:
                    self.settingsItem.value = SettingsValue.deletable(virtualTransformation: .hideScopes(regex: regex))
                case .flattenScopes:
                    self.settingsItem.value = SettingsValue.deletable(virtualTransformation: .flattenScopes(regex: regex))
                default:
                    assertionFailure()
                }
            }
        }
        
    }
}
