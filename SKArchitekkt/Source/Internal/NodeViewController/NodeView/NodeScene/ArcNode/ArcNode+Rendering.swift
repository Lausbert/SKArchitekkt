// Copyright © 2020 Stephan Lerner. All rights reserved.

import SpriteKit

extension ArcNode {
    
    // MARK: - Internal -
    
    static func render(_ virtualArcs: [VirtualArc]) -> [ArcNode] {
        virtualArcs.map { virtualArc in
            render(virtualArc)
        }
    }
    
    static func diffChildren(oldVirtualArcs: [VirtualArc], newVirtualArcs: [VirtualArc]) -> (SKNode) -> Void {
        
        var childPatches: [(SKNode) -> Void] = []
        
        return { parent in
            
        }
    }
    
    // MARK: - Private -
    
    private static func render(_ virtualArc: VirtualArc) -> ArcNode {
        ArcNode(
            sourceIdentifier: virtualArc.sourceIdentifier,
            destinationIdentifier: virtualArc.destinationIdentifier,
            weight: virtualArc.weight
        )
    }
    
    private static func diff(oldVirtualArc: VirtualArc, newVirtualArc: VirtualArc?) -> ((SKNode) -> Void)? {
        guard let newVirtualArc = newVirtualArc else {
            return { oldArcNode in
                oldArcNode.removeFromParent()
            }
        }
        
        if newVirtualArc != oldVirtualArc {
            return { oldArcNode in
                guard let parent = oldArcNode.parent, let index = parent.children.firstIndex(of: oldArcNode) else {
                    assertionFailure()
                    return
                }
                oldArcNode.removeFromParent()
                let newArcNode = render(newVirtualArc)
                parent.insertChild(newArcNode, at: index)
            }
        }
        
        return nil
    }
        
}
