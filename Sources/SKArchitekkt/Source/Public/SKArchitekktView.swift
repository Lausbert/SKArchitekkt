// Copyright © 2020 Stephan Lerner. All rights reserved.

import SwiftUI
import CoreArchitekkt

public struct SKArchitekktView: View {
    @Binding var document: Document
    
    @State private var isShowingRightPane: Bool = true

    public var body: some View {
        GeometryReader { geometry in
            VStack {
                HSplitView {
                    VStack { Text("Pane 1") }.frame(maxWidth: .infinity, maxHeight: .infinity)
                    if isShowingRightPane {
                        VStack { Text("Pane 2") }.frame(maxWidth: .infinity, maxHeight: .infinity)
                    }
                    
                }
            }.frame(width: geometry.size.width, height: geometry.size.height)
            .presentedWindowToolbarStyle(UnifiedWindowToolbarStyle()).toolbar {
                Button(action: { isShowingRightPane.toggle() } ) {
                    Image(systemName: "sidebar.right")
                }
            }.transition(.scale(scale: 1, anchor: UnitPoint(x: 0.5, y: 1)))
        }
    }
    
    public init(document: Binding<Document>) {
        self._document = document
    }
}

struct SKArchitekktView_Previews: PreviewProvider {
    static var previews: some View {
        SKArchitekktView(document: .constant(Document()))
    }
}
