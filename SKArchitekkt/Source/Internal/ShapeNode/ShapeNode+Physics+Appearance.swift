//  Copyright © 2019 Stephan Lerner. All rights reserved.

import SpriteKit
import CoreArchitekkt

extension ShapeNode {

    // MARK: - Internal -

    private static let radiusObjectAssociation = ObjectAssociation<CGFloat>()
    private(set) var radius: CGFloat {
        get { return ShapeNode.radiusObjectAssociation[self] ?? 16 }
        set { ShapeNode.radiusObjectAssociation[self] = newValue }
    }

    func setUpPhysicsAndAppearance() {
        guard physicsBody == nil else { return }
        assert(physicsBody == nil, "Setup shapenode a second time.")
        isCollapsed = !isRoot
        children.forEach { $0.isHidden = isCollapsed }
        setUpPhysicsBody()
        updateRadius()
        resetChildrenPosition()
    }

    func didDoubleTap() {
        guard castedChildren.count > 0 else { return }
        isCollapsed = !isCollapsed
        if !isCollapsed {
            castedChildren.forEach {
                $0.isHidden = false
                $0.updateTextNodes()
            }
        } else {
            allCastedDescendants.forEach {
                $0.isHidden = true
                $0.isCollapsed = true
                $0.children.filter { $0 is SKLabelNode }.forEach { $0.removeFromParent() }
                $0.arcNodeDictionary.values.forEach { $0.removeFromParent() }
                $0.arcNodeDictionary = [:]
            }
            allCastedDescendants.forEach {
                $0.updateRadius()
            }
        }
        updateRadius()
        updateAncestorsRadius()
        if !isCollapsed {
            resetChildrenPosition()
        }
    }

    func setColors(_ dictionary: [String: NSColor]) {
        scopeColorDictionary = dictionary
        updateColor()
    }

    func updatePhysicsWith(forceDecay: CGFloat, velocityDecay: CGFloat) {
        castedChildren.forEach { $0.updatePhysicsWith(forceDecay: forceDecay, velocityDecay: velocityDecay) }
        updateRadialGravitationalForceOnChildrenWith(forceDecay: forceDecay)
        updateNegativeRadialGravitationalForceOnSiblingsWith(forceDecay: forceDecay)
        updateSpringForceBetweenByArcConnectedNodes(forceDecay: forceDecay)
        physicsBody?.velocity *= velocityDecay
    }

    func updateAppearance() {
        castedChildren.forEach { $0.updateAppearance() }
        updateArcNodesAppearance()
    }

    // MARK: - Private -

    private static let isCollapsedObjectAssociation = ObjectAssociation<Bool>()
    private var isCollapsed: Bool {
        get { return ShapeNode.isCollapsedObjectAssociation[self] ?? true }
        set { ShapeNode.isCollapsedObjectAssociation[self] = newValue }
    }
    private static let scopeColorDictionaryObjectAssociation = ObjectAssociation<[String: NSColor]>()
    private var scopeColorDictionary: [String: NSColor] {
        get { return ShapeNode.scopeColorDictionaryObjectAssociation[self] ?? [:] }
        set { ShapeNode.scopeColorDictionaryObjectAssociation[self] = newValue }
    }
    private static let arcNodeDictionaryObjectAssociation = ObjectAssociation<[ShapeNode: SKShapeNode]>()
    private var arcNodeDictionary: [ShapeNode: SKShapeNode] {
        get { return ShapeNode.arcNodeDictionaryObjectAssociation[self] ?? [:] }
        set { ShapeNode.arcNodeDictionaryObjectAssociation[self] = newValue }
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

    private func updateRadius() {
        let minimumRadius = CGFloat(16)
        let areaOfChildren = isCollapsed ? minimumRadius : castedChildren.map { $0.radius^^2 }.reduce(0, +)
        let radius = max(minimumRadius, 2.5*sqrt(areaOfChildren))
        path = CGPath(ellipseIn: CGRect(x: -radius, y: -radius, width: 2*radius, height: 2*radius), transform: nil)
        self.radius = radius
        updateConstraints()
        updatePhysicsBody()
        updateTextNodes()
        updateColor()
    }

    private func updateAncestorsRadius() {
        var node = self
        while let parent = node.castedParent {
            parent.updateRadius()
            node = parent
        }
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
        let name = identifier?.components(separatedBy: ".").last ?? scope
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
                labelNode.fontColor = .textColor
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
        return scopeColorDictionary[scope, default: .windowFrameColor]
    }

    private func resetChildrenPosition() {
        castedChildren.forEach {
            $0.position = CGPoint(x: CGFloat.random(in: -radius/2...radius/2), y: CGFloat.random(in: -radius/2...radius/2))
        }
    }

    private func updateRadialGravitationalForceOnChildrenWith(forceDecay: CGFloat) {
        guard !isCollapsed else { return }
        castedChildren.forEach {
            let force = computeForceBetween(first: self, second: $0, minimumRadius: radius, multiplier: forceDecay*radius^^2*$0.radius^^2, proportionalToDistanceRaisedToPowerOf: -1.9)
            $0.physicsBody?.applyForce(force)
        }
    }

    private func updateNegativeRadialGravitationalForceOnSiblingsWith(forceDecay: CGFloat) {
        guard !isCollapsed, castedChildren.count > 1 else { return }
        for pair in siblingPairs {
            let force = computeForceBetween(first: pair.0, second: pair.1, multiplier: forceDecay*pair.0.radius^^2*pair.1.radius^^2, proportionalToDistanceRaisedToPowerOf: -1.3)
            pair.0.physicsBody?.applyForce(force)
            pair.1.physicsBody?.applyForce(-force)
        }
    }

    private func updateSpringForceBetweenByArcConnectedNodes(forceDecay: CGFloat) {
        guard !isHidden else { return }
        for arc in resultingArcs {
            let force = computeForceBetween(first: self, second: arc, multiplier: forceDecay, proportionalToDistanceRaisedToPowerOf: 1.1)
            self.physicsBody?.applyForce(-force)
            arc.physicsBody?.applyForce(force)
            var node = self
            while let parent = node.castedParent, !arc.allCastedAncestors.contains(parent) {
                parent.physicsBody?.applyForce(-force)
                arc.physicsBody?.applyForce(force)
                node = parent
            }
            node = arc
            while let parent = node.castedParent, !allCastedAncestors.contains(parent) {
                self.physicsBody?.applyForce(-force)
                parent.physicsBody?.applyForce(force)
                node = parent
            }
        }
    }

    private func computeForceBetween(first: ShapeNode, second: ShapeNode, minimumRadius: CGFloat = 0, multiplier: CGFloat = 1, proportionalToDistanceRaisedToPowerOf power: CGFloat = 1) -> CGVector {
        guard let scene = scene else { return CGVector.zero }
        let distanceVector = first.convert(CGPoint.zero, to: scene) - second.convert(CGPoint.zero, to: scene)
        let distance = distanceVector.length()
        let newDistance = max(distance, minimumRadius)
        let normalizedDistanceVector = distance > 0 ? distanceVector/distance : CGVector.zero // important note: normalizedDistanceVector is not really normalized in case of distance <= 0
        let force = 100*multiplier*newDistance^^power*normalizedDistanceVector
        return force
    }

    private func updateArcNodesAppearance() {
        arcNodeDictionary.forEach { $1.isHidden = true }
        guard !isHidden else { return }
        resultingArcs.forEach { updateArcNodeAppearance(to: $0) }
    }

    private func updateArcNodeAppearance(to: ShapeNode) {
        guard let arcNode = arcNodeDictionary[to] else {
            let arcNode = SKShapeNode()
            arcNode.strokeColor = .windowFrameColor
            arcNode.lineWidth = 2
            arcNode.zPosition = -1
            scene?.addChild(arcNode)
            arcNodeDictionary[to] = arcNode
            return
        }
        guard let scene = scene else {
            return
        }
        arcNode.isHidden = false
        let fromPositionCenter = self.convert(CGPoint.zero, to: scene)
        let toPositionCenter = to.convert(CGPoint.zero, to: scene)
        let distanceVector = fromPositionCenter - toPositionCenter
        let distance = distanceVector.length()
        let fromPosition = fromPositionCenter - self.radius/distance*distanceVector
        let toPosition = toPositionCenter + to.radius/distance*distanceVector
        let path = CGMutablePath()
        path.move(to: fromPosition)
        path.addLine(to: toPosition)
        arcNode.path = path
    }

}
