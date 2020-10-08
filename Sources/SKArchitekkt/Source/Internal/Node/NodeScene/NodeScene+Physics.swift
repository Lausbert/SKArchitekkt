//  Copyright © 2019 Stephan Lerner. All rights reserved.

import SpriteKit
import CoreArchitekkt
import Combine

extension NodeScene: SKSceneDelegate {

    // MARK: - Internal -

    func setUpPhysics() {
        delegate = self
        physicsWorld.gravity = CGVector.zero
        settingsItemCancellable = document.settings.forceSettingsDomain.objectDidChange.sink { [weak self] _ in
            self?.updateSettingsValues()
            self?.startSimulation()
            self?.document.incrementVersion()
        }
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

    private var forceDecayTarget: CGFloat { return 0 }
    private var forceDecayMin: CGFloat { return 0.1 }
    private var forceDecayDecay: CGFloat { return 0.000773012*exp(0.858245*(2*decayPower+1)) }
    private var velocityDecay: CGFloat { return 0.000133437*exp(2.9706*(2*decayPower+1)) }

    private static let forceDecayObjectAssociation = ObjectAssociation<CGFloat>()
    private var forceDecay: CGFloat {
        get { NodeScene.forceDecayObjectAssociation[self] ?? 1 }
        set { NodeScene.forceDecayObjectAssociation[self] = newValue }
    }
    private static let settingsItemCancellableObjectAssociation = ObjectAssociation<AnyCancellable>()
    private var settingsItemCancellable: AnyCancellable? {
        get { NodeScene.settingsItemCancellableObjectAssociation[self] }
        set { NodeScene.settingsItemCancellableObjectAssociation[self] = newValue }
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
            let force = radialGravitationForceOnChildrenMultiplier*computeForceBetween(first: shapeNode, second: $0, minimumRadius: shapeNode.radius, multiplier: forceDecay*shapeNode.radius^^2*$0.radius^^2, proportionalToDistanceRaisedToPowerOf: -1.4)
            $0.physicsBody?.applyForce(force)
        }
    }

    private func updateNegativeRadialGravitationalForceOnSiblings(for shapeNode: ShapeNode, withForceDecay forceDecay: CGFloat) {
        guard shapeNode.castedChildren.count > 1 else { return }
        for pair in shapeNode.siblingPairs {
            let force = computeForceBetween(first: pair.0, second: pair.1, multiplier: 5*forceDecay*pair.0.radius^^2*pair.1.radius^^2, proportionalToDistanceRaisedToPowerOf: negativeRadialGravitationalForceOnSiblingsPower)
            pair.0.physicsBody?.applyForce(force)
            pair.1.physicsBody?.applyForce(-force)
        }
    }

    private func updateSpringForce(for arcNode: ArcNode, withForceDecay forceDecay: CGFloat) {
            guard
                let sourceShapedNode = shapeNodesDictionary[arcNode.sourceIdentifier],
                let destinationShapeNode = shapeNodesDictionary[arcNode.destinationIdentifier]
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
            let offSetDistance = -(lastSource.radius + lastDestination.radius)
            let multiplier = min(10, max(1, log(CGFloat(arcNode.weight))))
        let force = computeForceBetween(first: sourceShapedNode, second: destinationShapeNode, offSetDistance: offSetDistance, multiplier: forceDecay*multiplier, proportionalToDistanceRaisedToPowerOf: springForceBetweenConnectedNodesPower)
            sources.forEach {
                $0.physicsBody?.applyForce(-force)
            }
            tos.forEach {
                $0.physicsBody?.applyForce(force)
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
        let fromPosition = sourcePositionCenter - (sourceShapedNode.radius+(sourceShapedNode.lineWidth/2))/distance*distanceVector
        let toPosition = toPositionCenter + (destinationShapeNode.radius+(destinationShapeNode.lineWidth/2))/distance*distanceVector
        let baseWidth = 8*min(10, max(1, log(CGFloat(arcNode.weight))))
        let path = CGPath.arrow(from: fromPosition, to: toPosition, tailWidth: baseWidth, headWidth: 2*baseWidth, headLength: 2*baseWidth)
        arcNode.path = path
    }

}
