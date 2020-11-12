//  Copyright © 2019 Stephan Lerner. All rights reserved.

import SpriteKit
import SwiftUI
import CoreArchitekkt

struct NodeView: View {
    
    // MARK: - Internal -
    
    // In case you are wondering these weird create-methods of NodeScene and UpdateStatus: When a node is built for the first time, SwiftUI calls the body below two times. Somehow it shows the NodeScene of one call, while it shows the data of the updateStatus of the other call if initialized normally. By using the static create functions we are only creating one NodeScene and one UpdateStatus in the first place by saving them to a private static dictionary. Documents id is key for both. This has the nice side effect, that we can change Document in NodeScene without triggering a reinitiliazing of NodeScene during a new body call.
    
    let updateStatus: UpdateStatus
    @Binding var document: Document

    var body: some View {
        GeometryReader { proxy in
            NodeViewRepresantable(document: $document, scene: NodeScene.create(document: $document, updateStatus: updateStatus), proxy: proxy)
        }
    }
}
