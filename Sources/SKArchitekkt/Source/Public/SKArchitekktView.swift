// Copyright © 2020 Stephan Lerner. All rights reserved.

import SwiftUI
import CoreArchitekkt

public struct SKArchitekktView: View {
    
    // MARK: - Public -
    
    // In case you are wondering these weird create-methods of NodeScene and UpdateStatus: When a node is built for the first time, SwiftUI calls the body below two times. Somehow it shows the NodeScene of one call, while it shows the data of the updateStatus of the other call if initialized normally. By using the static create functions we are only creating one NodeScene and one UpdateStatus in the first place by saving them to a private static dictionary. Documents id is key for both. This has the nice side effect, that we can change Document in NodeScene without triggering a reinitiliazing of NodeScene during a new body call.
    
    @Binding public var document: Document

    public var body: some View {
        HStack(spacing: 0) {
            NodeView(scene: NodeScene.create(document: $document, updateStatus: updateStatus))
            if isShowingRightPane {
                SettingsTabView(settings: document.settings)
                    .transition(.move(edge: .trailing))
            }
        }
        .toolbar {
            ToolbarItemGroup(placement: .principal) {
                UpdateStatusView(updateStatus: updateStatus) {
                    WarningAccessoryView(warnings: document.warnings)
                }
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
        self.updateStatus = UpdateStatus.create(id: document.wrappedValue.id, description: "Running \(document.wrappedValue.nodeRequest.description)", progress: 1.0)
    }
    
    // MARK: - Private -
    
    @State private var isShowingRightPane = true
    private let updateStatus: UpdateStatus
    
}
