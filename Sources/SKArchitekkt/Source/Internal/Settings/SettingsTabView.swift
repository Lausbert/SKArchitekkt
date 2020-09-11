// Copyright © 2020 Stephan Lerner. All rights reserved.

import SwiftUI
import CoreArchitekkt

struct SettingsTabView: View {
    
    // MARK: - Internal -
    
    @Binding private(set) var document: Document
    
    var body: some View {
        SystemTabView(
            side: .right,
            tabs: [
                ("slider.horizontal.3", AnyView(SettingsView(settingsGroups: document.settings.forceSettingsGroups))),
                ("eye", AnyView(SettingsView(settingsGroups: document.settings.visibilitySettingsGroups)))
            ]
        )
    }

}

