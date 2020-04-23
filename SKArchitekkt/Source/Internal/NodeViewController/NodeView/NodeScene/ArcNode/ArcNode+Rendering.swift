// Copyright © 2020 Stephan Lerner. All rights reserved.

import SpriteKit

extension ArcNode {
    
    static func render(_ arcs: [VirtualArc]) -> [ArcNode] {
        arcs.map { arc in
            ArcNode(
                sourceIdentifier: arc.sourceIdentifier,
                destinationIdentifier: arc.destinationIdentifier,
                weight: arc.weight
            )
        }
    }
    
}
