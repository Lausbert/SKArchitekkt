// Copyright © 2020 Stephan Lerner. All rights reserved.

import SwiftUI
import CoreArchitekkt

struct NodeViewRepresantable: View {
    
    // MARK: - Internal -
    
    @Binding private(set) var document: Document
        
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Text("Pane 1")
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
        }
    }
            
}
