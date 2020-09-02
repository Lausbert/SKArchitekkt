//  Copyright © 2019 Stephan Lerner. All rights reserved.

import SpriteKit

class NodeView: SKView {

    // MARK: - Internal -

    override func scrollWheel(with event: NSEvent) {
        self.scene?.scrollWheel(with: event)
    }

    override func magnify(with event: NSEvent) {
        self.scene?.magnify(with: event)
    }

    func setUp(with settings: Settings) {
        ignoresSiblingOrder = true
        #if DEBUG
        showsFPS = true
        #endif

        let scene = NodeScene(with: settings)
        scene.scaleMode = .resizeFill
        presentScene(scene)
    }

}
