//  Copyright © 2019 Stephan Lerner. All rights reserved.

import SpriteKit
import CoreArchitekkt
import Combine

extension NodeScene: SKSceneDelegate {

    // MARK: - Internal -

    func setUpPhysics() {
        delegate = self
        physicsWorld.gravity = CGVector.zero
    }

    func startSimulation() {
        updateForceSettingsValues()
        updateStatus(description: "Running \(document.nodeRequest.description)", progress: 1.0)
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

    private var forceDecayTarget: CGFloat { 0 }
    private var forceDecayMin: CGFloat { 0.1 }
    private var forceDecayDecay: CGFloat { 0.000773012*exp(0.858245*(2*decayPower+1)) }
    private var velocityDecay: CGFloat { 0.000133437*exp(2.9706*(2*decayPower+1)) }
    private var radialGravitationalForceOnChildrenConstantMultiplier: CGFloat { 50.0 }
    private var radialGravitationalForceOnChildrenConstantPower: CGFloat { -1.4 }
    private var negativeRadialGravitationalForceOnSiblingsConstantMulitplier: CGFloat { 250.0 }
    private var springForceConstantMultiplier: CGFloat { 500.0 }

    private static let forceDecayObjectAssociation = ObjectAssociation<CGFloat>()
    private var forceDecay: CGFloat {
        get { NodeScene.forceDecayObjectAssociation[self] ?? 1 }
        set { NodeScene.forceDecayObjectAssociation[self] = newValue }
    }

    private func updatePhysicsWith(forceDecay: CGFloat, velocityDecay: CGFloat) {
        if shapeRootNode.castedChildren.count == 1 {
            shapeRootNode.castedChildren[0].position = CGPoint(x: 0, y: 0)
        }
        for shapeNode in shapeNodesDictionary.values {
            updateRadialGravitationalForceOnChildren(for: shapeNode, withForceDecay: forceDecay)
            updateNegativeRadialGravitationalForceOnSiblings(for: shapeNode, withForceDecay: forceDecay)
            shapeNode.physicsBody?.velocity *= (1 - velocityDecay)
        }
        for arcNode in arcNodes {
            updateSpringForce(for: arcNode, withForceDecay: forceDecay)
        }
    }

    private func updateAppearance() {
        for arcNode in arcNodes {
            updateAppearance(for: arcNode)
        }
    }

    private func updateRadialGravitationalForceOnChildren(for shapeNode: ShapeNode, withForceDecay forceDecay: CGFloat) {
        shapeNode.castedChildren.forEach {
            let distanceVector = -CGVector(dx: $0.position.x, dy: $0.position.y)
            let force = computeForceBetween(
                distanceVector: distanceVector,
                minimumPhysicalRadius: shapeNode.physicalRadius,
                multiplier: radialGravitationalForceOnChildrenConstantMultiplier*forceDecay*shapeNode.physicalRadius^^2*$0.physicalRadius^^2,
                proportionalToDistanceRaisedToPowerOf: radialGravitationalForceOnChildrenConstantPower)
            $0.physicsBody?.applyForce(force)
        }
    }

    private func updateNegativeRadialGravitationalForceOnSiblings(for shapeNode: ShapeNode, withForceDecay forceDecay: CGFloat) {
        guard shapeNode.castedChildren.count > 1 else { return }
        for pair in shapeNode.siblingPairs {
            let distanceVector = pair.0.position - pair.1.position
            let force = computeForceBetween(
                distanceVector: distanceVector, multiplier: negativeRadialGravitationalForceOnSiblingsConstantMulitplier*forceDecay*pair.0.physicalRadius^^2*pair.1.physicalRadius^^2, proportionalToDistanceRaisedToPowerOf: negativeRadialGravitationalForceOnSiblingsPower)
            pair.0.physicsBody?.applyForce(force)
            pair.1.physicsBody?.applyForce(-force)
        }
    }

    private func updateSpringForce(for arcNode: ArcNode, withForceDecay forceDecay: CGFloat) {
            guard
                let sourceShapedNode = shapeNodesDictionary[arcNode.sourceIdentifier],
                let destinationShapeNode = shapeNodesDictionary[arcNode.destinationIdentifier],
                let scene = scene
                else {
                    assertionFailure()
                    return
            }
            var sources = [sourceShapedNode]
            let allSourceCastedAncestors = sourceShapedNode.allCastedAncestors
            let allDestinationCastedAncestors = destinationShapeNode.allCastedAncestors
            while let parent = sources.last?.castedParent, !allDestinationCastedAncestors.contains(parent) {
                sources.append(parent)
            }
            var tos = [destinationShapeNode]
            while let parent = tos.last?.castedParent, !allSourceCastedAncestors.contains(parent) {
                tos.append(parent)
            }
            guard let lastSource = sources.last, let lastDestination = tos.last else { return }
            let offSetDistance = -(lastSource.physicalRadius + lastDestination.physicalRadius)
        let multiplier = springForceConstantMultiplier*sqrt(CGFloat(arcNode.weight))
        let distanceVector = sourceShapedNode.convert(.zero, to: scene) - destinationShapeNode.convert(.zero, to: scene)
        let force = computeForceBetween(distanceVector: distanceVector, offSetDistance: offSetDistance, multiplier: forceDecay*multiplier, proportionalToDistanceRaisedToPowerOf: springForceBetweenConnectedNodesPower)
            sources.forEach {
                $0.physicsBody?.applyForce(-force)
            }
            tos.forEach {
                $0.physicsBody?.applyForce(force)
            }
    }

    private func computeForceBetween(distanceVector: CGVector, offSetDistance: CGFloat = 0, minimumPhysicalRadius: CGFloat = 0, multiplier: CGFloat = 1, proportionalToDistanceRaisedToPowerOf power: CGFloat = 1) -> CGVector {
        let distance = distanceVector.length() + offSetDistance
        let newDistance = max(distance, minimumPhysicalRadius)
        let normalizedDistanceVector = distance > 0 ? distanceVector/distance : CGVector.zero // important note: normalizedDistanceVector is not really normalized in case of distance <= 0
        let force = multiplier*newDistance^^power*normalizedDistanceVector
        return force
    }

    private func updateAppearance(for arcNode: ArcNode) {
        guard
            let scene = scene,
            let sourceShapedNode = shapeNodesDictionary[arcNode.sourceIdentifier],
            let destinationShapeNode = shapeNodesDictionary[arcNode.destinationIdentifier]
            else {
                assertionFailure()
                return
        }
        let sourcePositionCenter = sourceShapedNode.convert(CGPoint.zero, to: scene)
        let toPositionCenter = destinationShapeNode.convert(CGPoint.zero, to: scene)
        let distanceVector = sourcePositionCenter - toPositionCenter
        let distance = distanceVector.length()
        let fromPosition = sourcePositionCenter - (sourceShapedNode.visualRadius+(sourceShapedNode.lineWidth/2))/distance*distanceVector
        let toPosition = toPositionCenter + (destinationShapeNode.visualRadius+(destinationShapeNode.lineWidth/2))/distance*distanceVector
        let baseWidth = arcWidthMultiplier*sqrt(CGFloat(arcNode.weight))
        let path = CGPath.arrow(from: fromPosition, to: toPosition, tailWidth: baseWidth, headWidth: 2*baseWidth, headLength: 2*baseWidth)
        arcNode.path = path
    }

}
