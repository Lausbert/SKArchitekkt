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
                    .padding(4)
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
        
        let settingsGroup: SettingsGroup
        
        var body: some View {
            VStack(alignment: .leading) {
                if !settingsGroup.name.isEmpty {
                    Text(settingsGroup.name)
                        .padding(4)
                        .font(.subheadline)
                }
                ForEach(settingsGroup.settingsItems) { settingsItem in
                    SettingsItemView(settingsItem: settingsItem)
                }
                if settingsGroup.settingsItems.isEmpty {
                    Text("Empty")
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding(4)
                        .font(.footnote)
                        .foregroundColor(.gray)
                }
            }
        }
    }
    
    private struct SettingsItemView: View {
        
        let settingsItem: SettingsItem
        
        var body: some View {
            Text(settingsItem.name)
                .padding(4)
                .font(.subheadline)
        }
    }
}
