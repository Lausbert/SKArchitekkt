//  Copyright © 2019 Stephan Lerner. All rights reserved.

import SpriteKit
import CoreArchitekkt

class ShapeNode: SKShapeNode {

    // MARK: - Internal -

    static let identifier = "ShapeNode"

    let id: UUID
    let scope: String
    let nodeName: String?
    let castedChildren: [ShapeNode]
    private(set) var radius: CGFloat
    
    var allDescendants: [ShapeNode] {
           return castedChildren + castedChildren.flatMap { $0.allDescendants }
    }
    
    init(id: UUID, scope: String, name: String?, children: [ShapeNode], color: CGColor, radius: CGFloat) {
        self.id = id
        self.scope = scope
        self.nodeName = name
        self.castedChildren = children
        self.radius = radius
        super.init()
        
        setUpPhysicsBody()
        children.forEach { addChild($0) }
        update(color: color)
        update(radius: radius)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func update(color: CGColor) {
        guard let color = NSColor(cgColor: color) else {
            return
        }
        fillColor = castedChildren.isEmpty ? color : .clear
        strokeColor = color
        lineWidth = 8
    }
    
    func update(radius: CGFloat) {
        self.radius = radius
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
        let fontSize = radius/3
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
