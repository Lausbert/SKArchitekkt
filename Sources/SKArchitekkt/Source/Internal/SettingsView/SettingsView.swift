// Copyright © 2020 Stephan Lerner. All rights reserved.

import SwiftUI
import CoreArchitekkt

struct SettingsView: View {
    
    @Binding var document: Document
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Divider()
                Text("Pane 2")
                Divider()
            }
            .frame(width: geometry.size.width, height: geometry.size.height, alignment: .topLeading)
        }
        .frame(width: 250)
    }
    
}
