// Copyright © 2020 Stephan Lerner. All rights reserved.

import SwiftUI
import CoreArchitekkt

struct SettingsView: View {
    
    let settingsDomains: [SettingsDomain]

    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                ForEach(settingsDomains) { settingsDomain in
                    VStack(alignment: .leading, spacing: 0) {
                        Text(settingsDomain.name).padding(4)
                        Divider()
                    }
                }
            }
        }
    }
    
}
