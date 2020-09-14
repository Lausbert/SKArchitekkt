//  Copyright © 2019 Stephan Lerner. All rights reserved.

import SpriteKit
import CoreArchitekkt

class NodeScene: SKScene {

    // MARK: - Internal -

    let document: Document

    init(document: Document) {
        self.document = document
        super.init(size: CGSize.zero)
        backgroundColor = NSColor.controlBackgroundColor
        setUpPhysics()
        setUpMouseInteraction()
        setUpRendering()
        add(rootNode: document.node)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
