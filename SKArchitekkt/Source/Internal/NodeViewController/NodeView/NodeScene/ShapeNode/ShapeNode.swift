//  Copyright © 2019 Stephan Lerner. All rights reserved.

import SpriteKit
import CoreArchitekkt

class ShapeNode: SKShapeNode {

    // MARK: - Internal -

    static let name = "ShapeNode"

    let id: UUID
    let scope: String
    let nodeName: String?
    let castedChildren: [ShapeNode]
    let siblingPairs: [(ShapeNode, ShapeNode)]
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
        self.castedChildren = children
        self.radius = radius
        var siblingPairs: [(ShapeNode, ShapeNode)] = []
        for (index, first) in castedChildren[..<castedChildren.count].enumerated() {
            for second in castedChildren[(index+1)...] {
                siblingPairs.append((first, second))
            }
        }
        self.siblingPairs = siblingPairs

        super.init()
        self.name = ShapeNode.name
        
        setUpChildren()
        setUpPhysicsBody()
        update(color: color)
        update(radius: radius)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
    
    private func setUpChildren() {
        castedChildren.forEach {
            addChild($0)
            $0.position = CGPoint(x: CGFloat.random(in: -radius/2...radius/2), y: CGFloat.random(in: -radius/2...radius/2))
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
