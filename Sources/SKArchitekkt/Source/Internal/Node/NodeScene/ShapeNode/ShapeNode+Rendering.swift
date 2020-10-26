// Copyright © 2020 Stephan Lerner. All rights reserved.

import SpriteKit
import CoreArchitekkt

extension ShapeNode {

    // MARK: - Internal -
    
    static func align(newVirtualNodes: [VirtualNode], with oldVirtualNodes: [VirtualNode]) -> [VirtualNode] {
        var newVirtualNodesDictionary = Dictionary(uniqueKeysWithValues: newVirtualNodes.map {($0.id, $0)} )
        var newVirtualNodes: [VirtualNode] = []
        for oldVirtualNode in oldVirtualNodes {
            if let newVirtualNode = newVirtualNodesDictionary.removeValue(forKey: oldVirtualNode.id) {
                let children = align(newVirtualNodes: newVirtualNode.children, with: oldVirtualNode.children)
                newVirtualNodes.append(
                    VirtualNode(
                        id: newVirtualNode.id,
                        scope: newVirtualNode.scope,
                        name: newVirtualNode.name,
                        children: children,
                        color: newVirtualNode.color,
                        physicalRadius: newVirtualNode.physicalRadius,
                        visualRadius: newVirtualNode.visualRadius
                    )
                )
            }
        }
        newVirtualNodes.append(contentsOf: newVirtualNodesDictionary.values)
        return newVirtualNodes
    }

    static func diffChildren(oldVirtualNodes: [VirtualNode], newVirtualNodes: [VirtualNode]) -> (ShapeNode) -> Void {

        var childPatches: [(ShapeNode) -> Void] = []
        var index = 0
        for oldVirtualNode in oldVirtualNodes {
            if let newVirtualNode = newVirtualNodes[safe: index] {
                if newVirtualNode.id == oldVirtualNode.id {
                    childPatches.append(diff(oldVirtualNode: oldVirtualNode, newVirtualNode: newVirtualNode))
                    index += 1
                } else {
                    childPatches.append(diff(oldVirtualNode: oldVirtualNode, newVirtualNode: nil))
                }
            } else {
                childPatches.append(diff(oldVirtualNode: oldVirtualNode, newVirtualNode: nil))
                index += 1
            }
        }

        var additionalPatches: [(ShapeNode) -> Void] = []
        if newVirtualNodes.endIndex > index {
            for newVirtualNode in newVirtualNodes[index...] {
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
        return ShapeNode.create(
            id: node.id,
            scope: node.scope,
            name: node.name,
            children: children,
            color: node.color,
            physicalRadius: node.physicalRadius,
            visualRadius: node.visualRadius
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

        let childrenPatch = diffChildren(oldVirtualNodes: oldVirtualNode.children, newVirtualNodes: newVirtualNode.children)
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
            if oldVirtualNode.physicalRadius != newVirtualNode.physicalRadius || oldVirtualNode.visualRadius != newVirtualNode.visualRadius {
                oldShapeNode.update(color: newVirtualNode.color)
                oldShapeNode.update(physicalRadius: newVirtualNode.physicalRadius, visualRadius: newVirtualNode.visualRadius)
            }
        }
    }

}
