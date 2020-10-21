// Copyright © 2020 Stephan Lerner. All rights reserved.

import SwiftUI
import CoreArchitekkt

public struct SKArchitekktView: View {
    
    // MARK: - Public -
    
    @Binding public var document: Document

    public var body: some View {
        HStack(spacing: 0) {
            NodeView(scene: NodeScene(document: $document, updateStatus: updateStatus))
            if isShowingRightPane {
                SettingsTabView(settings: document.settings)
                    .transition(.move(edge: .trailing))
            }
        }
        .toolbar {
            ToolbarItemGroup(placement: .principal) {
                UpdateStatusView(updateStatus: updateStatus)
            }
            ToolbarItemGroup(placement: .automatic) {
                Spacer()
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
    
    // MARK: - Private -
    
    @State private var isShowingRightPane = true
    private let updateStatus = UpdateStatus(description: "Running", progress: 1.0)
    
}
