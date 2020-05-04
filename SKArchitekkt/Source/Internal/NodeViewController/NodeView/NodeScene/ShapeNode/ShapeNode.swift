//  Copyright © 2019 Stephan Lerner. All rights reserved.

import SpriteKit
import CoreArchitekkt

class ShapeNode: SKShapeNode {

    // MARK: - Internal -

    static let name = "ShapeNode"

    let id: UUID
    let scope: String
    let nodeName: String?
    private(set) var castedChildren: [ShapeNode]
    private(set) var siblingPairs: [(ShapeNode, ShapeNode)]
    private(set) var radius: CGFloat

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

    init(id: UUID, scope: String, name: String?, children: [ShapeNode], color: NSColor, radius: CGFloat) {
        self.id = id
        self.scope = scope
        self.nodeName = name
        self.castedChildren = []
        self.siblingPairs = []
        self.radius = radius

        super.init()
        self.name = ShapeNode.name

        setUp(children)
        setUpPhysicsBody()
        update(color: color)
        update(radius: radius)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func addChild(_ node: SKNode) {
        if let shapeNode = node as? ShapeNode {
            castedChildren.append(shapeNode)
            updateSiblingPairs()
            shapeNode.resetPosition()
        }
        super.addChild(node)
    }

    func replaceChild(_ oldShapeNode: ShapeNode, with newShapeNode: ShapeNode) {
        if let index = castedChildren.firstIndex(of: oldShapeNode) {
            castedChildren.insert(newShapeNode, at: index)
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
    }

    func update(color: NSColor) {
        fillColor = castedChildren.isEmpty ? color : color.withAlphaComponent(0.1)
        strokeColor = color
        lineWidth = 16
    }

    func update(radius: CGFloat) {
        self.radius = radius
        updatePath()
        updateConstraints()
        updatePhysicsBody()
        updateTextNodes()
    }

    // MARK: - Private -

    private func updateSiblingPairs() {
        siblingPairs = []
        for (index, first) in castedChildren[..<castedChildren.count].enumerated() {
            for second in castedChildren[(index+1)...] {
                siblingPairs.append((first, second))
            }
        }
    }

    private func resetPosition() {
        position = CGPoint(x: CGFloat.random(in: -radius/50...radius/50), y: CGFloat.random(in: -radius/50...radius/50))
    }

    private func setUpPhysicsBody() {
        let physicsBody = SKPhysicsBody(circleOfRadius: radius)
        physicsBody.isDynamic = true
        physicsBody.charge = 0
        physicsBody.mass = radius^^2
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
        path = CGPath(ellipseIn: CGRect(x: -radius, y: -radius, width: 2*radius, height: 2*radius), transform: nil)
    }

    private func updateConstraints() {
        castedChildren.forEach {
            $0.constraints = [SKConstraint.distance(SKRange(lowerLimit: 0, upperLimit: radius - $0.radius), to: self)]
        }
    }

    private func updatePhysicsBody() {
        physicsBody?.mass = radius^^2
    }

    private func updateTextNodes() {
        guard !isHidden else { return }
        let name = nodeName?.components(separatedBy: ".").last ?? scope
        children.filter { $0 is SKLabelNode }.forEach { $0.removeFromParent() }
        let nameLength = CGFloat(name.count)
        var lettersPerFullCircle = CGFloat(24)
        let angleDifference = 2*CGFloat.pi/lettersPerFullCircle
        var angle: CGFloat
        let isSpiral: Bool
        if nameLength > lettersPerFullCircle {
            angle = CGFloat.pi
            isSpiral = true
        } else {
            angle = CGFloat.pi/2 + ((nameLength-1)/2)*angleDifference
            isSpiral = false
        }
        let fontSize = min(radius/3, 10000) // there is a maximum font size, otherwise it will crash
        let fontScalingFactor = CGFloat(1.25)
        let resutlingFontSize = fontSize/fontScalingFactor
        for (index, character) in name.enumerated() {
            let resultingRadius = isSpiral ? (radius - (CGFloat(index)/lettersPerFullCircle*resutlingFontSize)) : radius
            let x = cos(angle)*(resultingRadius - resutlingFontSize)
            let y = sin(angle)*(resultingRadius - resutlingFontSize)
            let labelNode = SKLabelNode(text: "\(character)")
            labelNode.position = CGPoint(x: x, y: y)
            labelNode.zRotation = angle - CGFloat.pi/2
            labelNode.fontSize = fontSize
            if castedChildren.isEmpty {
                labelNode.fontColor = .black
                labelNode.fontName = NSFont.systemFont(ofSize: fontSize).fontName
            } else {
                labelNode.fontColor = NSColor.textColor.blended(withFraction: 0.3, of: .clear)
                labelNode.fontName = NSFont.systemFont(ofSize: fontSize, weight: .light).fontName
            }
            addChild(labelNode)
            let resultingAngleDifference = isSpiral ? angleDifference/(resultingRadius/radius) : angleDifference
            lettersPerFullCircle = 2*CGFloat.pi/resultingAngleDifference
            angle -= resultingAngleDifference
            if resultingRadius < radius/2 {
                labelNode.text = "…"
                break
            }
        }
    }

}
