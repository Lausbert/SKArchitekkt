// Copyright © 2020 Stephan Lerner. All rights reserved.

import SpriteKit
import CoreArchitekkt

extension ArcNode {

    // MARK: - Internal -

    static func diffChildren(oldVirtualArcNodes: [VirtualArcNode], newVirtualArcNodes: [VirtualArcNode]) -> (SKNode) -> Void {

        var childPatches: [(SKNode) -> Void] = []
        for (index, oldVirtualArcNode) in oldVirtualArcNodes.enumerated() {
            childPatches.append(diff(oldVirtualArcNode: oldVirtualArcNode, newVirtualArcNode: newVirtualArcNodes[safe: index]))
        }

        var additionalPatches: [(SKNode) -> Void] = []
        if newVirtualArcNodes.endIndex > oldVirtualArcNodes.endIndex {
            for newVirtualArcNode in newVirtualArcNodes[oldVirtualArcNodes.endIndex...] {
                additionalPatches.append { parent in
                    let newArcNode = render(newVirtualArcNode)
                    parent.addChild(newArcNode)
                }
            }
        }

        return { parent in
            parent.children.enumerated().forEach { (index, element) in
                childPatches[index](element)
            }
            additionalPatches.forEach { additionalPatch in
                additionalPatch(parent)
            }
        }
    }

    // MARK: - Private -

    private static func render(_ virtualArcNode: VirtualArcNode) -> ArcNode {
        ArcNode(
            sourceIdentifier: virtualArcNode.sourceIdentifier,
            destinationIdentifier: virtualArcNode.destinationIdentifier,
            weight: virtualArcNode.weight
        )
    }

    private static func diff(oldVirtualArcNode: VirtualArcNode, newVirtualArcNode: VirtualArcNode?) -> (SKNode) -> Void {
        guard let newVirtualArcNode = newVirtualArcNode else {
            return { oldArcNode in
                oldArcNode.removeFromParent()
            }
        }

        if newVirtualArcNode != oldVirtualArcNode {
            return { oldArcNode in
                guard let parent = oldArcNode.parent, let index = parent.children.firstIndex(of: oldArcNode) else {
                    assertionFailure()
                    return
                }
                oldArcNode.removeFromParent()
                let newArcNode = render(newVirtualArcNode)
                parent.insertChild(newArcNode, at: index)
            }
        }

        return { _ in }
    }

}
