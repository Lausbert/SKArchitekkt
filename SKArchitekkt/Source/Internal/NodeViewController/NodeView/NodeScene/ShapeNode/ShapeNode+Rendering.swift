// Copyright © 2020 Stephan Lerner. All rights reserved.

import SpriteKit

extension ShapeNode {
    
    static func render(_ nodes: [VirtualNode]) -> [ShapeNode] {
        nodes.map { node in
            let children = render(node.children)
            return ShapeNode(
                id: node.id,
                scope: node.scope,
                name: node.name,
                children: children,
                color: node.color,
                radius: node.radius
            )
        }
    }
    
}
