// Copyright © 2020 Stephan Lerner. All rights reserved.

import SwiftUI
import CoreArchitekkt

struct SettingsView: View {
    
    let settingsGroups: [SettingsGroup]

    var body: some View {
        List(settingsGroups) { settingsGroup in
            VStack(alignment: .leading) {
                Text(settingsGroup.name)
                Divider()
            }
        }
    }
    
}
