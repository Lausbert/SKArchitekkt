// Copyright © 2020 Stephan Lerner. All rights reserved.

import SpriteKit

extension ShapeNode {

    // MARK: - Internal -

    static func diffChildren(oldVirtualNodes: [VirtualNode], newVirtualNode: [VirtualNode]) -> (ShapeNode) -> Void {

        var childPatches: [(ShapeNode) -> Void] = []
        for (index, oldVirtualNode) in oldVirtualNodes.enumerated() {
            childPatches.append(diff(oldVirtualNode: oldVirtualNode, newVirtualNode: newVirtualNode[safe: index]))
        }

        var additionalPatches: [(ShapeNode) -> Void] = []
        if newVirtualNode.endIndex > oldVirtualNodes.endIndex {
            for newVirtualNode in newVirtualNode[oldVirtualNodes.endIndex...] {
                additionalPatches.append { parent in
                    let newShapeNode = render(newVirtualNode)
                    parent.addChild(newShapeNode)
                }
            }
        }

        return { parent in
            parent.children.compactMap({ $0 as? ShapeNode }).enumerated().forEach { (index, element) in
                childPatches[index](element)
            }
            additionalPatches.forEach { additionalPatch in
                additionalPatch(parent)
            }
        }
    }

    // MARK: - Private -

    private static func render(_ node: VirtualNode) -> ShapeNode {
        let children = node.children.map { render($0) }
        return ShapeNode(
            id: node.id,
            scope: node.scope,
            name: node.name,
            children: children,
            color: node.color,
            radius: node.radius
        )
    }

    private static func diff(oldVirtualNode: VirtualNode, newVirtualNode: VirtualNode?) -> (ShapeNode) -> Void {
        guard let newVirtualNode = newVirtualNode else {
            return { oldShapeNode in
                oldShapeNode.removeFromParent()
            }
        }

        if newVirtualNode.id != oldVirtualNode.id {
            return { oldShapeNode in
                guard let parent = oldShapeNode.castedParent else {
                    assertionFailure()
                    return
                }
                let newShapeNode = render(newVirtualNode)
                parent.replaceChild(oldShapeNode, with: newShapeNode)
            }
        }

        let childrenPatch = diffChildren(oldVirtualNodes: oldVirtualNode.children, newVirtualNode: newVirtualNode.children)
        let attributesPatch = diffAttributes(oldVirtualNode: oldVirtualNode, newVirtualNode: newVirtualNode)

        return { oldShapeNode in
            childrenPatch(oldShapeNode)
            attributesPatch(oldShapeNode)
        }
    }

    private static func diffAttributes(oldVirtualNode: VirtualNode, newVirtualNode: VirtualNode) -> (ShapeNode) -> Void { { oldShapeNode in
            if oldVirtualNode.color != newVirtualNode.color {
                oldShapeNode.update(color: newVirtualNode.color)
            }
            if oldVirtualNode.radius != newVirtualNode.radius {
                oldShapeNode.update(color: newVirtualNode.color)
                oldShapeNode.update(radius: newVirtualNode.radius)
            }
        }
    }

}
