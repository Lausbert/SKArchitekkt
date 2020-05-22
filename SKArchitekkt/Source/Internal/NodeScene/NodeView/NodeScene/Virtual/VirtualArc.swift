// Copyright © 2020 Stephan Lerner. All rights reserved.

import Foundation
import CoreArchitekkt

struct VirtualArc: Hashable {

    // MARK: - Internal -

    let sourceIdentifier: UUID
    let destinationIdentifier: UUID
    let weight: Int

    static func createVirtualArcs(from node: Node, with transformations: Set<VirtualTransformation>) -> [VirtualArc] {
        let virtualArcContext = createVirtualArcContext(
            from: node,
            with: transformations
        )
        var weightDictionary = virtualArcContext.weightDictionary
        weightDictionary.forEach { (weightLessVirtualArc, weight) in
            if let newDestination = virtualArcContext.destinationMapping[weightLessVirtualArc.destinationIdentifier] {
                let newWeightLessVirtualArc = VirtualArcContext.WeightLessVirtualArc(
                    sourceIdentifier: weightLessVirtualArc.sourceIdentifier,
                    destinationIdentifier: newDestination
                )
                weightDictionary[newWeightLessVirtualArc] = weightDictionary[newWeightLessVirtualArc, default: 0] + weight
                weightDictionary.removeValue(forKey: weightLessVirtualArc)
            }
        }
        return weightDictionary.map {
            VirtualArc(
                sourceIdentifier: $0.sourceIdentifier,
                destinationIdentifier: $0.destinationIdentifier,
                weight: $1
            )
        }.sorted { (lhs, rhs) -> Bool in
            if lhs.sourceIdentifier != rhs.sourceIdentifier {
                return lhs.sourceIdentifier.uuidString < rhs.sourceIdentifier.uuidString
            } else {
                return lhs.destinationIdentifier.uuidString < rhs.destinationIdentifier.uuidString
            }
        }
    }

    // MARK: - Private -

    private struct TransformationContext: Hashable {
        let identifier: UUID
        let transformations: Set<VirtualTransformation>
    }

    private struct VirtualArcContext: Hashable {

        struct WeightLessVirtualArc: Hashable {
            let sourceIdentifier: UUID
            let destinationIdentifier: UUID
        }

        let weightDictionary: [WeightLessVirtualArc: Int]
        let destinationMapping: [UUID: UUID]
        let foldedIds: Set<UUID>

    }

    private static var virtualArcContextCache: [TransformationContext: VirtualArcContext] = [:]

    private static func createVirtualArcContext(from node: Node, with transformations: Set<VirtualTransformation>) -> VirtualArcContext {

        let weightDictionary = Dictionary(
            uniqueKeysWithValues: node.arcs.map {
                (
                    VirtualArcContext.WeightLessVirtualArc(
                        sourceIdentifier: node.id,
                        destinationIdentifier: $0
                    ),
                    1
                )
            }
        )

        if transformations.contains(.unfoldNode(id: node.id)) {
            let virtualArcContext = createVirtualArcContext(
                from: node.children,
                with: transformations
            )
            return VirtualArcContext(
                weightDictionary: weightDictionary.merging(
                    virtualArcContext.weightDictionary,
                    uniquingKeysWith: { $0 + $1 }
                ),
                destinationMapping: virtualArcContext.destinationMapping,
                foldedIds: virtualArcContext.foldedIds
            )
        } else {
            let resultingTransformations = transformations.filter {
                if case .unfoldNode = $0 {
                    return false
                } else {
                    return true
                }
            }
            let transformationContext = TransformationContext(
                identifier: node.id,
                transformations: resultingTransformations
            )
            if let virtualArcContext = virtualArcContextCache[transformationContext] {
                return virtualArcContext
            }
            let virtualArcContext = createVirtualArcContext(
                from: node.children,
                with: resultingTransformations
            )
            let foldedIds = Set(node.children.map { $0.id })
            let resultingFoldedIds = foldedIds.union(virtualArcContext.foldedIds)
            var resultingWeightDictionary = weightDictionary
            virtualArcContext.weightDictionary.forEach { (weightLessVirtualArc, weight) in
                guard !resultingFoldedIds.contains(weightLessVirtualArc.destinationIdentifier) else {
                    return
                }
                let newNeightLessVirtualArc = VirtualArcContext.WeightLessVirtualArc(
                    sourceIdentifier: node.id,
                    destinationIdentifier: weightLessVirtualArc.destinationIdentifier
                )
                resultingWeightDictionary[newNeightLessVirtualArc] = resultingWeightDictionary[newNeightLessVirtualArc, default: 0] + weight
            }
            let childrenDestinationMapping = virtualArcContext.destinationMapping.map {($0.key, node.id)}
            let destinationMapping = Dictionary(uniqueKeysWithValues: node.children.map {($0.id, node.id)})
            let resultingDestinationMapping = destinationMapping.merging(
                childrenDestinationMapping,
                uniquingKeysWith: { $1 }
            )
            let resultingVirtualArcContext = VirtualArcContext(
                weightDictionary: resultingWeightDictionary,
                destinationMapping: resultingDestinationMapping,
                foldedIds: resultingFoldedIds
            )
            virtualArcContextCache[transformationContext] = resultingVirtualArcContext
            return resultingVirtualArcContext
        }
    }

    private static func createVirtualArcContext(from children: [Node], with transformations: Set<VirtualTransformation>) -> VirtualArcContext {
        var weightDictionary: [VirtualArcContext.WeightLessVirtualArc: Int] = [:]
        var destinationMapping: [UUID: UUID] = [:]
        var foldedIds: Set<UUID> = []
        children.forEach { child in
            let virtualArcContext = createVirtualArcContext(
                from: child,
                with: transformations
            )
            weightDictionary = weightDictionary.merging(virtualArcContext.weightDictionary, uniquingKeysWith: { $0 + $1 })
            destinationMapping.merge(virtualArcContext.destinationMapping) { $1 }
            foldedIds = foldedIds.union(virtualArcContext.foldedIds)
        }
        return VirtualArcContext(
            weightDictionary: weightDictionary,
            destinationMapping: destinationMapping,
            foldedIds: foldedIds
        )
    }

    private init(sourceIdentifier: UUID, destinationIdentifier: UUID, weight: Int) {
        self.sourceIdentifier = sourceIdentifier
        self.destinationIdentifier = destinationIdentifier
        self.weight = weight
    }

}

extension VirtualArc: CustomStringConvertible {

    // MARK: - Internal -

    var description: String {
        """

sourceIdentifier:      \(sourceIdentifier.uuidString)
destinationIdentifier: \(destinationIdentifier.uuidString)
weight:                \(weight)

"""
    }

}
