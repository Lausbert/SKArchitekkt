// Copyright © 2020 Stephan Lerner. All rights reserved.

import SpriteKit

extension ArcNode {

    // MARK: - Internal -

    static func diffChildren(oldVirtualArcs: [VirtualArc], newVirtualArcs: [VirtualArc]) -> (SKNode) -> Void {

        var childPatches: [(SKNode) -> Void] = []
        for (index, oldVirtualArc) in oldVirtualArcs.enumerated() {
            childPatches.append(diff(oldVirtualArc: oldVirtualArc, newVirtualArc: newVirtualArcs[safe: index]))
        }

        var additionalPatches: [(SKNode) -> Void] = []
        if newVirtualArcs.endIndex > oldVirtualArcs.endIndex {
            for newVirtualArc in newVirtualArcs[oldVirtualArcs.endIndex...] {
                additionalPatches.append { parent in
                    let newArcNode = render(newVirtualArc)
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

    private static func render(_ virtualArc: VirtualArc) -> ArcNode {
        ArcNode(
            sourceIdentifier: virtualArc.sourceIdentifier,
            destinationIdentifier: virtualArc.destinationIdentifier,
            weight: virtualArc.weight
        )
    }

    private static func diff(oldVirtualArc: VirtualArc, newVirtualArc: VirtualArc?) -> (SKNode) -> Void {
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

        return { _ in }
    }

}
