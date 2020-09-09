// Copyright © 2020 Stephan Lerner. All rights reserved.

import SwiftUI
import CoreArchitekkt

struct SettingsView: View {
    
    // MARK: - Internal -
    
    @Binding private(set) var document: Document
    
    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 0) {
                Picker("", selection: $state) {
                    Image(systemName: "slider.horizontal.3")
                    Image(systemName: "eye")
                }.pickerStyle(SegmentedPickerStyle())
                Divider()
                Text("Pane 2")
            }
            .frame(width: geometry.size.width, height: geometry.size.height, alignment: .topLeading)
        }
        .frame(width: 250)
    }
    
    // MARK: - Private -
    
    private enum TabState {
        case force
        case visibility
    }
        
    @State private var state: TabState = .force
    
}
