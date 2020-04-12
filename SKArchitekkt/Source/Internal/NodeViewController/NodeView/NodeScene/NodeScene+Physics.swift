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
        forceDecay -= (forceDecay - forceDecayTarget) * forceDecayDecay
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
    private var forceDecayDecay: CGFloat { return CGFloat(settings.forceDecaySettingsItem.value) }
    private var velocityDecay: CGFloat { return CGFloat(settings.velocityDecaySettingsitem.value) }

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
            shapeNode.physicsBody?.velocity *= (1 - velocityDecay)
        }
    }

    private func updateAppearance() {
        for shapeNode in castedChildren {
            updateArcNodeAppearance(for: shapeNode)
        }
    }

    private func updateRadialGravitationalForceOnChildren(for shapeNode: ShapeNode, withForceDecay forceDecay: CGFloat) {
        guard !shapeNode.isCollapsed else { return }
        shapeNode.castedChildren.forEach {
            let force = computeForceBetween(first: shapeNode, second: $0, minimumRadius: shapeNode.radius, multiplier: CGFloat(settings.radialGravitationalForceOnChildrenMultiplierSettingsItem.value)*forceDecay*shapeNode.radius^^2*$0.radius^^2, proportionalToDistanceRaisedToPowerOf: CGFloat(settings.radialGravitationalForceOnChildrenPowerSettingsItem.value))
            $0.physicsBody?.applyForce(force)
        }
    }

    private func updateNegativeRadialGravitationalForceOnSiblings(for shapeNode: ShapeNode, withForceDecay forceDecay: CGFloat) {
        guard !shapeNode.isCollapsed, shapeNode.castedChildren.count > 1 else { return }
        for pair in shapeNode.siblingPairs {
            let force = computeForceBetween(first: pair.0, second: pair.1, multiplier: CGFloat(settings.negativeRadialGravitationalForceOnSiblingsMultiplierSettingsItem.value)*forceDecay*pair.0.radius^^2*pair.1.radius^^2, proportionalToDistanceRaisedToPowerOf: CGFloat(settings.negativeRadialGravitationalForceOnSiblingsPowerSettingsItem.value))
            pair.0.physicsBody?.applyForce(force)
            pair.1.physicsBody?.applyForce(-force)
        }
    }

    private func updateSpringForce(for shapeNode: ShapeNode, withForceDecay forceDecay: CGFloat) {
        for (to, strength) in shapeNode.resultingArcs.compactMap({ (shapeNodeForNodeDictionary[$0.key], $0.value) }) {
            guard let to = to else {
                assertionFailure()
                continue
            }
            var froms = [shapeNode]
            let allCastedAncestors = shapeNode.allCastedAncestors
            let arcAllCastedAncestors = to.allCastedAncestors
            while let parent = froms.last?.castedParent, !arcAllCastedAncestors.contains(parent) {
                froms.append(parent)
            }
            var tos = [to]
            while let parent = tos.last?.castedParent, !allCastedAncestors.contains(parent) {
                tos.append(parent)
            }
            guard let lastFrom = froms.last, let lastTo = tos.last else { return }
            let offSetDistance = -(lastFrom.radius + lastTo.radius)
            let multiplier = min(10, max(1, log(CGFloat(strength))))
            let force = computeForceBetween(first: shapeNode, second: to, offSetDistance: offSetDistance, multiplier: CGFloat(settings.springForceBetweenConnectedNodesMultiplierSettingsItem.value)*forceDecay*multiplier, proportionalToDistanceRaisedToPowerOf: CGFloat(settings.springForceBetweenConnectedNodesPowerSettingsItem.value))
            froms.forEach {
                $0.physicsBody?.applyForce(-force)
            }
            tos.forEach {
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

    private func updateArcNodeAppearance(for shapeNode: ShapeNode) {
        guard let scene = scene else { return }
        for to in shapeNode.resultingArcs.keys {
            guard let toShapeNode = shapeNodeForNodeDictionary[to],
                let arcNode = arcNodeForArcDictionary[Arc(from: shapeNode.node, to: to)] else {
                continue
            }
            let fromPositionCenter = shapeNode.convert(CGPoint.zero, to: scene)
            let toPositionCenter = toShapeNode.convert(CGPoint.zero, to: scene)
            let distanceVector = fromPositionCenter - toPositionCenter
            let distance = distanceVector.length()
            let fromPosition = fromPositionCenter - (shapeNode.radius+(shapeNode.lineWidth/2))/distance*distanceVector
            let toPosition = toPositionCenter + (toShapeNode.radius+(toShapeNode.lineWidth/2))/distance*distanceVector
            let strength = shapeNode.resultingArcs[to, default: 0]
            let baseWidth = 8*min(10, max(1, log(CGFloat(strength))))
            let path = CGPath.arrow(from: fromPosition, to: toPosition, tailWidth: baseWidth, headWidth: 2*baseWidth, headLength: 2*baseWidth)
            arcNode.path = path
        }
    }

}
