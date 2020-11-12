//  Copyright © 2019 Stephan Lerner. All rights reserved.

import SpriteKit
import SwiftUI

struct NodeView: View {
    let scene: NodeScene

    var body: some View {
        GeometryReader { proxy in
            NodeViewRepresantable(scene: scene, proxy: proxy)
        }
    }
}
