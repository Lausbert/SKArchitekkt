// Copyright © 2020 Stephan Lerner. All rights reserved.

import SwiftUI
import CoreArchitekkt

struct SettingsTabView: View {
    
    // MARK: - Internal -
    
    let settings: CoreArchitekkt.Settings
    
    var body: some View {
        SystemTab(
            side: .right,
            tabs: [
                ("slider.horizontal.3", AnyView(SettingsView(settingsDomains: settings.firstDomains))),
                ("eye", AnyView(SettingsView(settingsDomains: settings.secondDomains)))
            ]
        )
    }

}

