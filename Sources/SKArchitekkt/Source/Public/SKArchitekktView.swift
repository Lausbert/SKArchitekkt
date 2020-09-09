// Copyright © 2020 Stephan Lerner. All rights reserved.

import SwiftUI
import CoreArchitekkt

public struct SKArchitekktView: View {
    
    @Binding var document: Document
    
    @State private var isShowingRightPane: Bool = true

    public var body: some View {
        GeometryReader { geometry in
            HStack(spacing: 0) {
                NodeViewRepresantable(document: $document)
                if isShowingRightPane {
                    DarkDivider()
                    SettingsView(document: $document)
                        .transition(.move(edge: .trailing))
                }
            }
            .toolbar {
                Button {
                    withAnimation { isShowingRightPane.toggle() }
                } label: {
                    Image(systemName: "sidebar.right")
                }
                .help("Hide or show the Inspectors")
            }
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
