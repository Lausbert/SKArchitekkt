// Copyright © 2020 Stephan Lerner. All rights reserved.

import SwiftUI
import CoreArchitekkt

struct SettingsView: View {
    
    // MARK: - Internal -
    
    let settingsDomains: [SettingsDomain]

    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                ForEach(settingsDomains) { settingsDomain in
                    SettingsDomainView(settingsDomain: settingsDomain)
                }
            }
        }
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
                if !settingsGroup.name.isEmpty {
                    Text(settingsGroup.name)
                        .padding(6)
                        .font(.subheadline)
                }
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
        let settingsItem: SettingsItem
                
        var body: some View {
            switch settingsItem.value {
            case let .range(_, minValue, maxValue):
                VStack(alignment: .leading, spacing: 0) {
                    Text(settingsItem.name)
                        .font(.subheadline).padding(6)
                    Slider(value: getRangeBinding(minValue: minValue, maxValue: maxValue), in: minValue...maxValue)
                        .padding(EdgeInsets(top: 0, leading: 16, bottom: 4, trailing: 16))
                }
            case .deletable:
                HStack {
                    Text(settingsItem.name)
                        .font(.subheadline).padding(6)
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
                    if case let .range(value, _, _) = self.settingsItem.value {
                        return value
                    } else {
                        assertionFailure()
                        return 0.0
                    }
                },
                set: {
                    self.settingsItem.value = SettingsValue.range(value: $0, minValue: minValue, maxValue: maxValue)
                }
            )
        }
        
    }
}
