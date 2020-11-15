// Copyright © 2020 Stephan Lerner. All rights reserved.

import SwiftUI
import CoreArchitekkt

struct SettingsTabView: View {
    
    // MARK: - Internal -
    
    @Binding var document: Document
    @Binding var settings: CoreArchitekkt.Settings
    
    var body: some View {
        SystemTab(
            side: .right,
            tabs: [
                ("slider.horizontal.3", AnyView(SettingsView(document: $document, settingsDomains: $settings.firstDomains))),
                ("eye", AnyView(SettingsView(document: $document, settingsDomains: $settings.secondDomains)))
            ]
        )
    }

}

