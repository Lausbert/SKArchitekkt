//  Copyright © 2019 Stephan Lerner. All rights reserved.

import SpriteKit
import CoreArchitekkt

class ShapeNode: SKShapeNode {

    // MARK: - Internal -

    let isRoot: Bool
    let identifier: String?
    let scope: String
    private(set) var arcs: [ShapeNode]

    var castedChildren: [ShapeNode] {
        return children.compactMap { $0 as? ShapeNode }
    }
    var siblingPairs: [(ShapeNode, ShapeNode)] {
        var siblingPairs: [(ShapeNode, ShapeNode)] = []
        for (index, first) in castedChildren[..<castedChildren.count].enumerated() {
            for second in castedChildren[(index+1)...] {
                siblingPairs.append((first, second))
            }
        }
        return siblingPairs
    }
    var allCastedDescendants: [ShapeNode] {
        guard !castedChildren.isEmpty else { return [] }
        return castedChildren + castedChildren.flatMap { $0.allCastedDescendants }
    }
    var resultingArcs: [ShapeNode] {
        let relevantArcs = arcs + castedChildren.flatMap { $0.isHidden ? $0.resultingArcs : [] }
        let redirectedRelevantArcs: [ShapeNode] = relevantArcs.compactMap {
            var node: ShapeNode? = $0
            while node?.isHidden == true {
                node = ($0.parent as? ShapeNode)
            }
            return node
        }
        return redirectedRelevantArcs.filter { $0 != self }
    }
    var castedParent: ShapeNode? {
        return parent as? ShapeNode
    }
    var allCastedAncestors: [ShapeNode] {
        var allCastedAncestors: [ShapeNode] = []
        var node = self
        while let parent = node.castedParent {
            allCastedAncestors.append(parent)
            node = parent
        }
        return allCastedAncestors
    }

    convenience init(rootNode: CoreArchitekkt.Node) {
        assert(rootNode.isRoot, "Initialized ShapeNode with non-root node.")
        self.init(node: rootNode)
        var nodeDictionary: [CoreArchitekkt.Node: ShapeNode] = [rootNode: self]
        rootNode.allDescendants.forEach { (node) in
            nodeDictionary[node] = ShapeNode(node: node)
        }
        for (node, shapeNode) in nodeDictionary {
            for child in node.children {
                assert(nodeDictionary[child] != nil)
                if let childShapeNode = nodeDictionary[child] {
                    shapeNode.addChild(childShapeNode)
                }
            }
            for arc in node.arcs {
                assert(nodeDictionary[arc] != nil)
                if let arcShapeNode = nodeDictionary[arc] {
                    shapeNode.arcs.append(arcShapeNode)
                }
            }
        }
        ([self] + allCastedDescendants).forEach { (node) in
            node.setUpPhysicsAndAppearance()
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Private -

    private init(node: CoreArchitekkt.Node) {
        isRoot = node.isRoot
        identifier = node.identifier
        scope = node.scope
        arcs = []
        super.init()
    }

}
