//  Copyright © 2019 Stephan Lerner. All rights reserved.

import SpriteKit
import CoreArchitekkt

class ShapeNode: SKShapeNode {

    // MARK: - Internal -

    static let name = "ShapeNode"

    static func create(
        id: UUID = UUID(),
        scope: String = "",
        name: String? = nil,
        children: [ShapeNode] = [],
        color: NSColor = .clear,
        physicalRadius: CGFloat = 0,
        visualRadius: CGFloat = 0,
        isShape: Bool = true
    ) -> ShapeNode {
        let shapeNode = pool.popLast() ?? ShapeNode()

        shapeNode.zPosition = 100
        shapeNode.id = id
        shapeNode.scope = scope
        shapeNode.nodeName = name
        shapeNode.castedChildren = []
        shapeNode.siblingPairs = []
        shapeNode.physicalRadius = physicalRadius
        shapeNode.visualRadius = visualRadius
        shapeNode.isShape = isShape

        shapeNode.setUp(children)

        if isShape {
            shapeNode.name = ShapeNode.name
            shapeNode.setUpPhysicsBody()
            shapeNode.update(color: color)
        }

        shapeNode.update(physicalRadius: physicalRadius, visualRadius: visualRadius)

        return shapeNode
    }

    private(set) var id: UUID = UUID()
    private(set) var scope: String = ""
    private(set) var nodeName: String?
    private(set) var castedChildren: [ShapeNode] = []
    private(set) var siblingPairs: [(ShapeNode, ShapeNode)] = []
    private(set) var physicalRadius: CGFloat = 0
    private(set) var visualRadius: CGFloat = 0
    private var isShape: Bool = true

    var allDescendants: [ShapeNode] {
           return castedChildren + castedChildren.flatMap { $0.allDescendants }
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

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func addChild(_ node: SKNode) {
        if let shapeNode = node as? ShapeNode {
            castedChildren.append(shapeNode)
            updateSiblingPairs()
            shapeNode.resetPosition()
            updateConstraints(forChild: shapeNode)
        }
        super.addChild(node)
    }

    func replaceChild(_ oldShapeNode: ShapeNode, with newShapeNode: ShapeNode) {
        if let index = castedChildren.firstIndex(of: oldShapeNode) {
            castedChildren.insert(newShapeNode, at: index)
            updateConstraints(forChild: newShapeNode)
            newShapeNode.resetPosition()
        } else {
            assertionFailure()
        }
        if let index = children.firstIndex(of: oldShapeNode) {
            insertChild(newShapeNode, at: index)
            oldShapeNode.removeFromParent()
        } else {
            assertionFailure()
        }
    }

    override func removeAllChildren() {
        castedChildren = []
        siblingPairs = []
        super.removeAllChildren()
    }

    override func removeFromParent() {
        children.forEach { $0.removeFromParent() }
        if let castedParent = castedParent,
            let index = castedParent.castedChildren.firstIndex(of: self) {
            castedParent.castedChildren.remove(at: index)
            castedParent.updateSiblingPairs()
        } else {
            assertionFailure()
        }
        super.removeFromParent()
        ShapeNode.store(shapeNode: self)
    }

    func update(color: NSColor) {
        guard isShape else {
            return
        }
        fillColor = castedChildren.isEmpty ? color.withAlphaComponent(0.8) : color.withAlphaComponent(0.1)
        strokeColor = color
        lineWidth = 16
    }

    func update(physicalRadius: CGFloat, visualRadius: CGFloat) {
        self.physicalRadius = physicalRadius
        self.visualRadius = visualRadius
        guard isShape else {
            return
        }
        updatePath()
        updateConstraints()
        updatePhysicsBody()
        updateTextNodes()
    }

    // MARK: - Private -

    private static var pool: [ShapeNode] = []

    private static func store(shapeNode: ShapeNode) {
        shapeNode.constraints = []
        shapeNode.physicsBody = nil
        shapeNode.path = nil
        shapeNode.removeAllChildren()
        pool.append(shapeNode)
    }
    
    private var labelNode: SKLabelNode?

    private override init() {
        super.init()
    }

    private func updateSiblingPairs() {
        siblingPairs = []
        for (index, first) in castedChildren[..<castedChildren.count].enumerated() {
            for second in castedChildren[(index+1)...] {
                siblingPairs.append((first, second))
            }
        }
    }

    private func resetPosition() {
        position = CGPoint(x: CGFloat.random(in: -physicalRadius/50...physicalRadius/50), y: CGFloat.random(in: -physicalRadius/50...physicalRadius/50))
    }

    private func setUpPhysicsBody() {
        let physicsBody = SKPhysicsBody(circleOfRadius: physicalRadius)
        physicsBody.isDynamic = true
        physicsBody.charge = 0
        physicsBody.mass = physicalRadius^^2
        physicsBody.linearDamping = 0
        physicsBody.allowsRotation = false
        physicsBody.collisionBitMask = 0
        self.physicsBody = physicsBody
    }

    private func setUp(_ children: [ShapeNode]) {
        children.forEach {
            addChild($0)
        }
    }

    private func updatePath() {
        path = CGPath(ellipseIn: CGRect(x: -visualRadius, y: -visualRadius, width: 2*visualRadius, height: 2*visualRadius), transform: nil)
    }

    private func updateConstraints(forChild child: ShapeNode? = nil) {
        guard isShape else {
            return
        }
        if let child = child {
            child.constraints = [SKConstraint.distance(SKRange(lowerLimit: 0, upperLimit: visualRadius - child.visualRadius), to: self)]
        } else {
            castedChildren.forEach {
                $0.constraints = [SKConstraint.distance(SKRange(lowerLimit: 0, upperLimit: visualRadius - $0.visualRadius), to: self)]
            }
        }
    }

    private func updatePhysicsBody() {
        physicsBody?.mass = physicalRadius^^2
    }

    private func updateTextNodes() {
        guard !isHidden else { return }
        labelNode?.removeFromParent()
        let name = nodeName?.components(separatedBy: ".").last ?? scope
        let fontSize = min(visualRadius/2, 10000) // there is a maximum font size, otherwise it will crash
        let labelNode = SKLabelNode(text: name, fontNamed: "HelveticaNeue-Bold", fontSize: fontSize, color: .textColor ,shadowColor: .shadowColor)
        self.labelNode = labelNode
        addChild(labelNode)
    }

}
