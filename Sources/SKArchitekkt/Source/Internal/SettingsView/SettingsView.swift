// Copyright © 2020 Stephan Lerner. All rights reserved.

import SwiftUI
import CoreArchitekkt

struct SettingsView: View {
    
    // MARK: - Internal -
    
    @Binding private(set) var document: Document
    
    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 0) {
                SystemSegmentControl(selection: $selection, systemImages: ["slider.horizontal.3", "eye"])
                Divider()
                switch selection {
                case 0:
                    Text("Tab 1")
                default:
                    Text("Tab 2")
                }
            }
            .frame(width: geometry.size.width, height: geometry.size.height, alignment: .topLeading)
        }
        .frame(width: 250)
    }
    
    // MARK: - Private -
    
    @State private var selection = 0

}

struct SystemSegmentControl : View {
    
    // MARK: - Internal -

    @Binding var selection : Int
    let systemImages: [String]

    var body : some View {
        HStack(spacing: 5) {
            ForEach (0..<systemImages.count) { i in
                SystemSegmentButton(selection: self.$selection, selectionIndex: i, systemImage: systemImages[i])
              }
        }
    }
}


struct SystemSegmentButton : View {
    
    // MARK: - Internal -

    @Binding var selection : Int
    let selectionIndex: Int
    let systemImage : String

    var body : some View {
        Button(action: { self.selection = self.selectionIndex }) {
            Image(systemName: systemImage)
                .padding(8)
                .foregroundColor(selectionIndex == selection ? .controlAccentColor : .controlColor)
        }
        .buttonStyle(BorderlessButtonStyle())
    }
}

