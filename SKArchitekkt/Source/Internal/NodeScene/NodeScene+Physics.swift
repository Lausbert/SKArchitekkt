//  Copyright © 2019 Stephan Lerner. All rights reserved.

import SpriteKit
import CoreArchitekkt

extension NodeScene: SKSceneDelegate {
    
    // MARK: - Internal -
    
    func setUpPhysicsWorld() {
        physicsWorld.gravity = CGVector.zero
    }
    
    func startSimulation() {
        isPaused = false
        forceDecay = 1
    }
    
    func stopSimulation() {
        isPaused = true
        forceDecay = 0
    }
    
    func update(_ currentTime: TimeInterval, for scene: SKScene) {
        forceDecay += (forceDecayTarget - forceDecay) * forceDecayDecay
        if forceDecay < forceDecayMin {
            stopSimulation()
            return
        }
        updatePhysicsWith(forceDecay: forceDecay, velocityDecay: velocityDecay)
    }
    
    func didApplyConstraints(for scene: SKScene) {
        updateAppearance()
    }
    
    // MARK: - Private -
    
    private static let forceDecayTargetObjectAssociation = ObjectAssociation<CGFloat>()
    private var forceDecayTarget: CGFloat { return 0 }
    private var forceDecayMin: CGFloat { return 0.1 }
    private var forceDecayDecay: CGFloat { return 0.005 }
    private var velocityDecay: CGFloat { return 0.9 }
    
    private static let forceDecayObjectAssociation = ObjectAssociation<CGFloat>()
    private var forceDecay: CGFloat {
        get { return NodeScene.forceDecayObjectAssociation[self] ?? 1 }
        set { NodeScene.forceDecayObjectAssociation[self] = newValue }
    }
    
    private func updatePhysicsWith(forceDecay: CGFloat, velocityDecay: CGFloat) {
        for shapeNode in castedChildren {
            updateRadialGravitationalForceOnChildren(for: shapeNode, withForceDecay: forceDecay)
            updateNegativeRadialGravitationalForceOnSiblings(for: shapeNode, withForceDecay: forceDecay)
            updateSpringForce(for: shapeNode, withForceDecay: forceDecay)
            shapeNode.physicsBody?.velocity *= velocityDecay
        }
    }

    private func updateAppearance() {
//        updateArcNodesAppearance()
    }
    
    private func updateRadialGravitationalForceOnChildren(for shapeNode: ShapeNode, withForceDecay forceDecay: CGFloat) {
        guard !shapeNode.isCollapsed else { return }
        shapeNode.castedChildren.forEach {
            let force = computeForceBetween(first: shapeNode, second: $0, minimumRadius: shapeNode.radius, multiplier: forceDecay*shapeNode.radius^^2*$0.radius^^2, proportionalToDistanceRaisedToPowerOf: -1.6)
            $0.physicsBody?.applyForce(force)
        }
    }
    
    private func updateNegativeRadialGravitationalForceOnSiblings(for shapeNode: ShapeNode, withForceDecay forceDecay: CGFloat) {
        guard !shapeNode.isCollapsed, shapeNode.castedChildren.count > 1 else { return }
        for pair in shapeNode.siblingPairs {
            let force = computeForceBetween(first: pair.0, second: pair.1, multiplier: forceDecay*pair.0.radius^^2*pair.1.radius^^2, proportionalToDistanceRaisedToPowerOf: -1.3)
            pair.0.physicsBody?.applyForce(force)
            pair.1.physicsBody?.applyForce(-force)
        }
    }
    
    private func updateSpringForce(for shapeNode: ShapeNode, withForceDecay forceDecay: CGFloat) {
        for arc in shapeNode.resultingArcs.compactMap( { arcMap[$0] } ) {
            var nodes = [shapeNode]
            let allCastedAncestors = shapeNode.allCastedAncestors
            let arcAllCastedAncestors = arc.allCastedAncestors
            while let parent = nodes.last?.castedParent, !arcAllCastedAncestors.contains(parent) {
                nodes.append(parent)
            }
            var arcs = [arc]
            while let parent = arcs.last?.castedParent, !allCastedAncestors.contains(parent) {
                arcs.append(parent)
            }
            guard let lastNode = nodes.last, let lastArc = arcs.last else { return }
            let offSetDistance = -(lastNode.radius + lastArc.radius)
            let force = computeForceBetween(first: shapeNode, second: arc, offSetDistance: offSetDistance, multiplier: forceDecay, proportionalToDistanceRaisedToPowerOf: 1.8)
            nodes.forEach {
                $0.physicsBody?.applyForce(-force)
            }
            arcs.forEach {
                $0.physicsBody?.applyForce(force)
            }
        }
    }
    
    private func computeForceBetween(first: ShapeNode, second: ShapeNode, offSetDistance: CGFloat = 0, minimumRadius: CGFloat = 0, multiplier: CGFloat = 1, proportionalToDistanceRaisedToPowerOf power: CGFloat = 1) -> CGVector {
        guard let scene = scene else { return CGVector.zero }
        let distanceVector = first.convert(CGPoint.zero, to: scene) - second.convert(CGPoint.zero, to: scene)
        let distance = distanceVector.length() + offSetDistance
        let newDistance = max(distance, minimumRadius)
        let normalizedDistanceVector = distance > 0 ? distanceVector/distance : CGVector.zero // important note: normalizedDistanceVector is not really normalized in case of distance <= 0
        let force = 100*multiplier*newDistance^^power*normalizedDistanceVector
        return force
    }
    
}

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

