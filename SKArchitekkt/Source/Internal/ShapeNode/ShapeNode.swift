//  Copyright © 2019 Stephan Lerner. All rights reserved.

import SpriteKit
import CoreArchitekkt

class ShapeNode: SKShapeNode {

    // MARK: - Internal -

    let node: Node
    
    private(set) var resultingArcs: [Node] = []
    var castedChildren: [ShapeNode] = []
    private(set) var siblingPairs: [(ShapeNode, ShapeNode)] = []
    
    var allCastedAncestors: [ShapeNode] {
        var allCastedAncestors: [ShapeNode] = []
        var node = self
        while let parent = node.parent as? ShapeNode {
            allCastedAncestors.append(parent)
            node = parent
        }
        return allCastedAncestors
    }
    
    init(node: CoreArchitekkt.Node) {
        self.node = node
        super.init()
        setUpPhysicsAndAppearance()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
