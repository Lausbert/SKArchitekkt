//  Copyright © 2019 Stephan Lerner. All rights reserved.

import SpriteKit
import CoreArchitekkt

class NodeScene: SKScene {

    // MARK: - Internal -

    let settings: Settings

    init(with settings: Settings) {
        self.settings = settings
        super.init(size: CGSize.zero)
        backgroundColor = NSColor.controlBackgroundColor
        setUpPhysics()
        setUpMouseInteraction()
        setUpRendering()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
