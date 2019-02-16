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
    
    convenience init(rootNode node: CoreArchitekkt.Node) {
        assert(node.isRoot, "Initialized ShapeNode with non-root node.")
        self.init(node: node)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private -
        
    private init(node: CoreArchitekkt.Node) {
        isRoot = node.isRoot
        identifier = node.identifier
        scope = node.scope
        arcs = node.arcs.map { ShapeNode(node: $0) }
        super.init()
        node.children.forEach { addChild(ShapeNode(node: $0)) }
        
        if isRoot {
            let namedDescendants = Dictionary(uniqueKeysWithValues: allCastedDescendants.compactMap { (node: ShapeNode) -> (String, ShapeNode)? in
                if let identifier = node.identifier {
                    return (identifier, node)
                }
                return nil
            })
            replaceAllNamedArcs(with: namedDescendants)
        }
        
        setUpPhysicsAndAppearance()
    }
    
    private func replaceAllNamedArcs(with namedDescendants: [String: ShapeNode]) {
        for arc in arcs {
            assert(identifier != nil)
            guard let identifier = arc.identifier else { return }
            assert(namedDescendants[identifier] != nil)
            guard let namedNode = namedDescendants[identifier] else { return }
            replace(arc: arc, with: namedNode)
        }
        castedChildren.forEach { $0.replaceAllNamedArcs(with: namedDescendants) }
    }
    
    private func replace(arc: ShapeNode, with namedNode: ShapeNode) {
        if let index = arcs.firstIndex(of: arc) {
            arcs[index] = namedNode
        }
    }
    
}
