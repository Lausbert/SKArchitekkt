// Copyright © 2020 Stephan Lerner. All rights reserved.

import SwiftUI
import CoreArchitekkt

struct SettingsView: View {
    
    // MARK: - Internal -
    
    @Binding private(set) var document: Document
    
    var body: some View {
        SystemTabView(
            side: .right,
            tabs: [
                ("slider.horizontal.3", AnyView(Text("Tab 1"))),
                ("eye", AnyView(Text("Tab 2")))
            ]
        )
    }

}

