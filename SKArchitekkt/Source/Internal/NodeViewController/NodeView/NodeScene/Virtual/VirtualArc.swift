// Copyright © 2020 Stephan Lerner. All rights reserved.

import Foundation
import CoreArchitekkt

struct VirtualArc: Hashable {

    // MARK: - Internal -

    let sourceIdentifier: UUID
    let destinationIdentifier: UUID
    let weight: Int

    static func createVirtualArcs(from node: Node, with transformations: Set<VirtualTransformation>) -> [VirtualArc] {
        let transformationContext = TransformationContext(
            node: node,
            transformations: transformations
        )
        if let virtualArcs = virtualArcsCache[transformationContext] {
            return virtualArcs
        }
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
        let virtualArcs = weightDictionary.map {
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
        virtualArcsCache[transformationContext] = virtualArcs
        return virtualArcs
    }

    // MARK: - Private -
    
    private struct TransformationContext: Hashable {
        let node: Node
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
    
    private static var virtualArcsCache: [TransformationContext: [VirtualArc]] = [:]
    private static var virtualArcContextCache: [TransformationContext: VirtualArcContext] = [:]

    private static func createVirtualArcContext(from node: Node, with transformations: Set<VirtualTransformation>) -> VirtualArcContext {
        let transformationContext = TransformationContext(
            node: node,
            transformations: transformations
        )
        if let virtualArcContext = virtualArcContextCache[transformationContext] {
            return virtualArcContext
        }
        
        let resultingWeightDictionary: [VirtualArcContext.WeightLessVirtualArc: Int]
        let resultingDestinationMapping: [UUID: UUID]
        let resultingFoldedIds: Set<UUID>
        
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

        if transformations.contains(.unfold(id: node.id)) {
            let virtualArcContext = createVirtualArcContext(
                from: node.children,
                with: transformations
            )
            
            resultingWeightDictionary = weightDictionary.merging(
                virtualArcContext.weightDictionary,
                uniquingKeysWith: { $0 + $1 }
            )
            resultingDestinationMapping = virtualArcContext.destinationMapping
            resultingFoldedIds = virtualArcContext.foldedIds
        } else {
            let resultingTransformations = transformations.filter {
                if case .unfold = $0 {
                    return false
                } else {
                    return true
                }
            }
            
            let virtualArcContext = createVirtualArcContext(
                from: node.children,
                with: resultingTransformations
            )
            
            let foldedIds = Set(node.children.map { $0.id })
            let temporaryFoldedIds = foldedIds.union(virtualArcContext.foldedIds)
            
            var temporaryWeightDictionary = weightDictionary
            virtualArcContext.weightDictionary.forEach { (weightLessVirtualArc, weight) in
                guard !temporaryFoldedIds.contains(weightLessVirtualArc.destinationIdentifier) else {
                    return
                }
                let newNeightLessVirtualArc = VirtualArcContext.WeightLessVirtualArc(
                    sourceIdentifier: node.id,
                    destinationIdentifier: weightLessVirtualArc.destinationIdentifier
                )
                temporaryWeightDictionary[newNeightLessVirtualArc] = temporaryWeightDictionary[newNeightLessVirtualArc, default: 0] + weight
            }
            
            let childrenDestinationMapping = virtualArcContext.destinationMapping.map {($0.key, node.id)}
            let destinationMapping = Dictionary(uniqueKeysWithValues: node.children.map {($0.id, node.id)})
            
            resultingWeightDictionary = temporaryWeightDictionary
            resultingDestinationMapping = destinationMapping.merging(
                childrenDestinationMapping,
                uniquingKeysWith: { $1 }
            )
            resultingFoldedIds = temporaryFoldedIds
        }
        
        let virtualArcContext = VirtualArcContext(
            weightDictionary: resultingWeightDictionary,
            destinationMapping: resultingDestinationMapping,
            foldedIds: resultingFoldedIds
        )
        virtualArcContextCache[transformationContext] = virtualArcContext
        return virtualArcContext
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
