// Copyright © 2020 Stephan Lerner. All rights reserved.

import SwiftUI
import CoreArchitekkt

public struct SKArchitekktView: View {
    
    // MARK: - Public -

    public var body: some View {
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
    
    public init(document: Binding<Document>) {
        self._document = document
    }
    
    // MARK: - Private -
    
    @Binding private var document: Document
    @State private var isShowingRightPane: Bool = true
    
}
