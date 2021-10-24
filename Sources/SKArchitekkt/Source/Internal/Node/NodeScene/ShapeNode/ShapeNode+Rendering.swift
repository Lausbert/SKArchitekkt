// Copyright © 2020 Stephan Lerner. All rights reserved.

import SpriteKit
import CoreArchitekkt

extension ShapeNode {

    // MARK: - Internal -

    static func diffChildren(oldVirtualShapeNodes: [VirtualShapeNode], newVirtualShapeNodes: [VirtualShapeNode], settings: Settings) -> (ShapeNode) -> Void {

        var childPatches: [(ShapeNode) -> Void] = []
        var index = 0
        for oldVirtualShapeNode in oldVirtualShapeNodes {
            if let newVirtualShapeNode = newVirtualShapeNodes[safe: index] {
                if newVirtualShapeNode.id == oldVirtualShapeNode.id {
                    childPatches.append(diff(oldVirtualShapeNode: oldVirtualShapeNode, newVirtualShapeNode: newVirtualShapeNode, settings: settings))
                    index += 1
                } else {
                    childPatches.append(diff(oldVirtualShapeNode: oldVirtualShapeNode, newVirtualShapeNode: nil, settings: settings))
                }
            } else {
                childPatches.append(diff(oldVirtualShapeNode: oldVirtualShapeNode, newVirtualShapeNode: nil, settings: settings))
                index += 1
            }
        }

        var additionalPatches: [(ShapeNode) -> Void] = []
        if newVirtualShapeNodes.endIndex > index {
            for newVirtualShapeNode in newVirtualShapeNodes[index...] {
                additionalPatches.append { parent in
                    let newShapeNode = render(newVirtualShapeNode, settings: settings)
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

    private static func render(_ node: VirtualShapeNode, settings: Settings) -> ShapeNode {
        let children = node.children.map { render($0, settings: settings) }
        return ShapeNode.create(
            id: node.id,
            scope: node.scope,
            name: node.name,
            children: children,
            radius: node.radius,
            ingoingArcsWeight: node.ingoingArcsWeight,
            outgoingArcsWeight: node.outgoingArcsWeight,
            isFixed: node.isFixed,
            settings: settings
        )
    }

    private static func diff(oldVirtualShapeNode: VirtualShapeNode, newVirtualShapeNode: VirtualShapeNode?, settings: Settings) -> (ShapeNode) -> Void {
        guard let newVirtualShapeNode = newVirtualShapeNode else {
            return { oldShapeNode in
                oldShapeNode.removeFromParent()
            }
        }

        if newVirtualShapeNode.id != oldVirtualShapeNode.id {
            return { oldShapeNode in
                guard let parent = oldShapeNode.castedParent else {
                    assertionFailure()
                    return
                }
                let newShapeNode = render(newVirtualShapeNode, settings: settings)
                parent.replaceChild(oldShapeNode, with: newShapeNode)
            }
        }

        let childrenPatch = diffChildren(oldVirtualShapeNodes: oldVirtualShapeNode.children, newVirtualShapeNodes: newVirtualShapeNode.children, settings: settings)
        let attributesPatch = diffAttributes(oldVirtualShapeNode: oldVirtualShapeNode, newVirtualShapeNode: newVirtualShapeNode, settings: settings)

        return { oldShapeNode in
            childrenPatch(oldShapeNode)
            attributesPatch(oldShapeNode)
        }
    }

    private static func diffAttributes(oldVirtualShapeNode: VirtualShapeNode, newVirtualShapeNode: VirtualShapeNode, settings: Settings) -> (ShapeNode) -> Void {
        { oldShapeNode in
            if oldVirtualShapeNode.radius != newVirtualShapeNode.radius
            || oldVirtualShapeNode.ingoingArcsWeight != newVirtualShapeNode.ingoingArcsWeight
            || oldVirtualShapeNode.outgoingArcsWeight != newVirtualShapeNode.outgoingArcsWeight
            || oldVirtualShapeNode.isFixed != newVirtualShapeNode.isFixed {
            oldShapeNode.update(isFixed: newVirtualShapeNode.isFixed)
            oldShapeNode.update(ingoingArcsWeigt: newVirtualShapeNode.ingoingArcsWeight, outgoingArcsWeight: newVirtualShapeNode.outgoingArcsWeight)
            oldShapeNode.update(radius: newVirtualShapeNode.radius, settings: settings) // needs to be called at last
            }
        }
    }

}
