//  Copyright © 2019 Stephan Lerner. All rights reserved.

import SpriteKit
import CoreArchitekkt

protocol ShapeNodeDelegate: class {

    func shapeNode(_ shapeNode: ShapeNode, didAdd child: ShapeNode)

    func shapeNode(_ shapeNode: ShapeNode, didRemove child: ShapeNode)

}

class ShapeNode: SKShapeNode {

    // MARK: - Internal -

    static let identifier = "ShapeNode"

    let node: Node

    private(set) var resultingArcs: [Node: Int] = [:]
    private(set) var castedChildren: [ShapeNode] = []
    private(set) var siblingPairs: [(ShapeNode, ShapeNode)] = []
    private(set) var radius: CGFloat = 16
    private(set) var isCollapsed = true

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

    init(node: CoreArchitekkt.Node, colorDictionary: [String: NSColor], delegate: ShapeNodeDelegate?) {
        self.node = node
        self.colorDictionary = colorDictionary
        self.delegate = delegate
        super.init()
        name = ShapeNode.identifier
        setUpPhysicsAndAppearance()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func addChild(_ node: SKNode) {
        super.addChild(node)
        if let child = node as? ShapeNode {
            delegate?.shapeNode(self, didAdd: child)
        }
    }

    override func removeFromParent() {
        let parent = self.parent as? ShapeNode
        super.removeFromParent()
        if let parent = parent {
            delegate?.shapeNode(parent, didRemove: self)
        }
    }

    func didDoubleTap() {
        set(collapsed: !isCollapsed)
    }

    // MARK: - Private -

    private weak var delegate: ShapeNodeDelegate?
    private var colorDictionary: [String: NSColor]

    private func setUpPhysicsAndAppearance() {
        setUpPhysicsBody()
        set(collapsed: true, forceFully: true)
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

    private func set(collapsed: Bool, forceFully: Bool = false) {
        let collapsed = node.children.count > 0 ? collapsed : true
        guard collapsed != isCollapsed || forceFully else { return }
        isCollapsed = collapsed
        updateChildren()
        updateRadius()
        updateAncestorsRadius()
        resetChildrenPosition()
    }

    private func updateChildren() {
        if isCollapsed {
            collapseDescendantsBottomUp()
            let castedChildren = self.castedChildren
            self.castedChildren = []
            self.siblingPairs = []
            self.resultingArcs = (node.arcs + node.allDescendants.flatMap { $0.arcs })
                .filter({ !([node] + node.allDescendants).contains($0) })
                .reduce(into: [:]) { $0[$1, default: 0] += 1 }
            castedChildren.forEach { $0.removeFromParent() }
        } else {
            let castedChildren = node.children.map { ShapeNode(node: $0, colorDictionary: colorDictionary, delegate: delegate) }
            self.castedChildren = castedChildren
            var siblingPairs: [(ShapeNode, ShapeNode)] = []
            for (index, first) in castedChildren[..<castedChildren.count].enumerated() {
                for second in castedChildren[(index+1)...] {
                    siblingPairs.append((first, second))
                }
            }
            self.siblingPairs = siblingPairs
            self.resultingArcs = node.arcs.reduce(into: [:]) { $0[$1] = 1 }
            castedChildren.forEach { addChild($0) }
        }
    }

    private func collapseDescendantsBottomUp(collapseSelf: Bool = false) {
        castedChildren.forEach { $0.collapseDescendantsBottomUp(collapseSelf: true) }
        if collapseSelf {
            set(collapsed: true)
        }
    }

    private func updateRadius() {
        let minimumRadius = CGFloat(16)
        let areaOfChildren = isCollapsed ? minimumRadius : castedChildren.map { $0.radius^^2 }.reduce(0, +)
        let radius = max(minimumRadius, 2.2*sqrt(areaOfChildren))
        path = CGPath(ellipseIn: CGRect(x: -radius, y: -radius, width: 2*radius, height: 2*radius), transform: nil)
        self.radius = radius
        updateConstraints()
        updatePhysicsBody()
        updateTextNodes()
        updateColor()
    }

    private func updateAncestorsRadius() {
        allCastedAncestors.forEach { $0.updateRadius() }
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
        let name = node.identifier?.components(separatedBy: ".").last ?? node.scope
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
            if isCollapsed {
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

    private func updateColor() {
        fillColor = isCollapsed ? colorForScope() : .clear
        strokeColor = colorForScope()
        lineWidth = 3
    }

    private func colorForScope() -> NSColor {
        return colorDictionary[node.scope, default: .windowFrameColor]
    }

    private func resetChildrenPosition() {
        castedChildren.forEach {
            $0.position = CGPoint(x: CGFloat.random(in: -radius/2...radius/2), y: CGFloat.random(in: -radius/2...radius/2))
        }
    }

}
