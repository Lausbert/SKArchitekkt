//  Copyright © 2019 Stephan Lerner. All rights reserved.

import SpriteKit

class NodeView: SKView {
    
    // MARK: - Internal -
    
    override func scrollWheel(with event: NSEvent) {
        self.scene?.scrollWheel(with: event)
    }
    
}
