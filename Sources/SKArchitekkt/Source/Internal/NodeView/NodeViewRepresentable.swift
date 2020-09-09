// Copyright © 2020 Stephan Lerner. All rights reserved.

import SwiftUI
import CoreArchitekkt

struct NodeViewRepresantable: View {
    
    @Binding var document: Document
    
    var body: some View {
        VStack { Text("Pane 1") }.frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
}
