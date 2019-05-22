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
        setUpPhysicsBody()
        set(collapsed: !node.isRoot)
    }

    func didDoubleTap() {
        set(collapsed: !isCollapsed)
    }

    func setColors(_ dictionary: [String: NSColor]) {
        scopeColorDictionary = dictionary
        updateColor()
    }
    
    func set(collapsed: Bool) {
        let collapsed = node.children.count > 0 ? collapsed : true
        isCollapsed = collapsed
        if isCollapsed {
            castedChildren.forEach { $0.removeFromParent() }
        } else {
            let castedChildren = node.children.map { (node) -> ShapeNode in
                let shapeNode = ShapeNode(node: node)
                addChild(shapeNode)
                return shapeNode
            }
            self.castedChildren = castedChildren
        }
        updateRadius()
        updateAncestorsRadius()
        if !isCollapsed {
            resetChildrenPosition()
        }
    }

    #warning("move to scene")
//    func updatePhysicsWith(forceDecay: CGFloat, velocityDecay: CGFloat) {
//        guard !isHidden else { return }
//        castedChildren.forEach { $0.updatePhysicsWith(forceDecay: forceDecay, velocityDecay: velocityDecay) }
//        updateRadialGravitationalForceOnChildrenWith(forceDecay: forceDecay)
//        updateNegativeRadialGravitationalForceOnSiblingsWith(forceDecay: forceDecay)
//        updateSpringForceBetweenByArcConnectedNodes(forceDecay: forceDecay)
//        physicsBody?.velocity *= velocityDecay
//    }
//
//    func updateAppearance() {
//        guard !isHidden else { return }
//        castedChildren.forEach { $0.updateAppearance() }
//        updateArcNodesAppearance()
//    }

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
//    private static let arcNodeDictionaryObjectAssociation = ObjectAssociation<[ShapeNode: SKShapeNode]>()
//    private var arcNodeDictionary: [ShapeNode: SKShapeNode] {
//        get { return ShapeNode.arcNodeDictionaryObjectAssociation[self] ?? [:] }
//        set { ShapeNode.arcNodeDictionaryObjectAssociation[self] = newValue }
//    }

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
        return scopeColorDictionary[node.scope, default: .windowFrameColor]
    }

    private func resetChildrenPosition() {
        castedChildren.forEach {
            $0.position = CGPoint(x: CGFloat.random(in: -radius/2...radius/2), y: CGFloat.random(in: -radius/2...radius/2))
        }
    }

    #warning("move to scene")
//    private func updateRadialGravitationalForceOnChildrenWith(forceDecay: CGFloat) {
//        guard !isCollapsed else { return }
//        castedChildren.forEach {
//            let force = computeForceBetween(first: self, second: $0, minimumRadius: radius, multiplier: forceDecay*radius^^2*$0.radius^^2, proportionalToDistanceRaisedToPowerOf: -1.6)
//            $0.physicsBody?.applyForce(force)
//        }
//    }
//
//    private func updateNegativeRadialGravitationalForceOnSiblingsWith(forceDecay: CGFloat) {
//        guard !isCollapsed, castedChildren.count > 1 else { return }
//        for pair in siblingPairs {
//            let force = computeForceBetween(first: pair.0, second: pair.1, multiplier: forceDecay*pair.0.radius^^2*pair.1.radius^^2, proportionalToDistanceRaisedToPowerOf: -1.3)
//            pair.0.physicsBody?.applyForce(force)
//            pair.1.physicsBody?.applyForce(-force)
//        }
//    }
//
//
//    private func updateSpringForceBetweenByArcConnectedNodes(forceDecay: CGFloat) {
//        for arc in resultingArcs {
//            var nodes = [self]
//            while let parent = nodes.last?.castedParent, !arc.allCastedAncestors.contains(parent) {
//                nodes.append(parent)
//            }
//            var arcs = [arc]
//            while let parent = arcs.last?.castedParent, !allCastedAncestors.contains(parent) {
//                arcs.append(parent)
//            }
//            guard let lastNode = nodes.last, let lastArc = arcs.last else { return }
//            let offSetDistance = -(lastNode.radius + lastArc.radius)
//            let force = computeForceBetween(first: self, second: arc, offSetDistance: offSetDistance, multiplier: forceDecay, proportionalToDistanceRaisedToPowerOf: 1.8)
//            nodes.forEach {
//                $0.physicsBody?.applyForce(-force)
//            }
//            arcs.forEach {
//                $0.physicsBody?.applyForce(force)
//            }
//        }
//    }
//
//    private func computeForceBetween(first: ShapeNode, second: ShapeNode, offSetDistance: CGFloat = 0, minimumRadius: CGFloat = 0, multiplier: CGFloat = 1, proportionalToDistanceRaisedToPowerOf power: CGFloat = 1) -> CGVector {
//        guard let scene = scene else { return CGVector.zero }
//        let distanceVector = first.convert(CGPoint.zero, to: scene) - second.convert(CGPoint.zero, to: scene)
//        let distance = distanceVector.length() + offSetDistance
//        let newDistance = max(distance, minimumRadius)
//        let normalizedDistanceVector = distance > 0 ? distanceVector/distance : CGVector.zero // important note: normalizedDistanceVector is not really normalized in case of distance <= 0
//        let force = 100*multiplier*newDistance^^power*normalizedDistanceVector
//        return force
//    }
//
//    private func updateArcNodesAppearance() {
//        arcNodeDictionary.forEach { $1.isHidden = true }
//        resultingArcs.forEach { updateArcNodeAppearance(to: $0) }
//    }
//
//    private func updateArcNodeAppearance(to: ShapeNode) {
//        guard let arcNode = arcNodeDictionary[to] else {
//            let arcNode = SKShapeNode()
//            arcNode.strokeColor = .windowFrameColor
//            arcNode.lineWidth = 2
//            arcNode.zPosition = -1
//            scene?.addChild(arcNode)
//            arcNodeDictionary[to] = arcNode
//            return
//        }
//        guard let scene = scene else {
//            return
//        }
//        arcNode.isHidden = false
//        let fromPositionCenter = self.convert(CGPoint.zero, to: scene)
//        let toPositionCenter = to.convert(CGPoint.zero, to: scene)
//        let distanceVector = fromPositionCenter - toPositionCenter
//        let distance = distanceVector.length()
//        let fromPosition = fromPositionCenter - self.radius/distance*distanceVector
//        let toPosition = toPositionCenter + to.radius/distance*distanceVector
//        let path = CGMutablePath()
//        path.move(to: fromPosition)
//        path.addLine(to: toPosition)
//        arcNode.path = path
//    }

}
