// Copyright © 2020 Stephan Lerner. All rights reserved.

import Foundation
import CoreArchitekkt

struct VirtualArc: Hashable {
    let sourceIdentifier: UUID
    let destinationIdentifier: UUID
    let weight: Int
    
    static func createVirtualArcs(from node: Node, with transformations: Set<VirtualTransformation>) -> [VirtualArc] {
        if transformations.contains(.unfold(id: node.id)) {
            var (childrenVirtualArcs, foldedDescendantsMapping) = createVirtualArcsAndFoldedDescendantsMapping(
                from: node.children,
                with: transformations
            )
            childrenVirtualArcs.forEach { (weightLessVirtualArc, weight) in
                if let newDestination = foldedDescendantsMapping[weightLessVirtualArc.destinationIdentifier] {
                    let newWeightLessVirtualArc = WeightLessVirtualArc(
                        sourceIdentifier: weightLessVirtualArc.sourceIdentifier,
                        destinationIdentifier: newDestination
                    )
                    childrenVirtualArcs[newWeightLessVirtualArc] = childrenVirtualArcs[newWeightLessVirtualArc, default: 0] + weight
                    childrenVirtualArcs.removeValue(forKey: weightLessVirtualArc)
                }
            }
            return childrenVirtualArcs.map {
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
        } else {
            return []
        }
        
    }
    
    private struct WeightLessVirtualArc: Hashable {
        let sourceIdentifier: UUID
        let destinationIdentifier: UUID
    }
    
    private typealias FoldedDescendantsMapping = [UUID: UUID]
    
    private static func createVirtualArcsAndFoldedDescendantsMapping(from node: Node, with transformations: Set<VirtualTransformation>) -> ([WeightLessVirtualArc: Int], FoldedDescendantsMapping) {
        
        let virtualArcs = Dictionary(
            uniqueKeysWithValues: node.arcs.map {
                (
                    WeightLessVirtualArc(
                        sourceIdentifier: node.id,
                        destinationIdentifier: $0
                    ),
                    1
                )
            }
        )
        
        if transformations.contains(.unfold(id: node.id)) {
            let (childrenVirtualArcs, foldedDescendantsMapping) = createVirtualArcsAndFoldedDescendantsMapping(
                from: node.children,
                with: transformations
            )
            return (
                virtualArcs.merging(
                    childrenVirtualArcs,
                    uniquingKeysWith: { $0 + $1 }),
                foldedDescendantsMapping
            )
        }
        
        var foldedDescendantIds: Set<UUID> = []
        var descendantVirtualArcs: [WeightLessVirtualArc: Int] = [:]
        node.allDescendants.forEach { descendant in
            foldedDescendantIds.insert(descendant.id)
            let d = Dictionary(
                uniqueKeysWithValues: descendant.arcs.map {
                    (
                        WeightLessVirtualArc(
                            sourceIdentifier: node.id,
                            destinationIdentifier: $0
                        ),
                        1
                    )
                }
            )
            descendantVirtualArcs = descendantVirtualArcs.merging(d, uniquingKeysWith: { $0 + $1})
        }
        
        let resultingDescendantVirtualArcs = descendantVirtualArcs.filter {
            !foldedDescendantIds.contains($0.key.destinationIdentifier)
        }
        let resultingVirtualArcs = virtualArcs.merging(
            resultingDescendantVirtualArcs,
            uniquingKeysWith: { $0 + $1 }
        )
        let foldedDescendantsMapping: FoldedDescendantsMapping = Dictionary(uniqueKeysWithValues: foldedDescendantIds.map { ($0, node.id) })
    
        return (resultingVirtualArcs, foldedDescendantsMapping)
    }
    
    private static func createVirtualArcsAndFoldedDescendantsMapping(from children: [Node], with transformations: Set<VirtualTransformation>) -> ([WeightLessVirtualArc: Int], FoldedDescendantsMapping) {
        var childrenVirtualArcs: [WeightLessVirtualArc: Int] = [:]
        var foldedDescendantsMapping: FoldedDescendantsMapping = [:]
        children.forEach { child in
            let (c, f) = createVirtualArcsAndFoldedDescendantsMapping(
                from: child,
                with: transformations
            )
            childrenVirtualArcs = childrenVirtualArcs.merging(c, uniquingKeysWith: { $0 + $1 })
            foldedDescendantsMapping.merge(f) { $1 }
        }
        return (childrenVirtualArcs, foldedDescendantsMapping)
    }
    
    private init(sourceIdentifier: UUID, destinationIdentifier: UUID, weight: Int) {
        self.sourceIdentifier = sourceIdentifier
        self.destinationIdentifier = destinationIdentifier
        self.weight = weight
    }

}

extension VirtualArc: CustomStringConvertible {
    
    var description: String {
        """
        
sourceIdentifier:      \(sourceIdentifier.uuidString)
destinationIdentifier: \(destinationIdentifier.uuidString)
weight:                \(weight)

"""
    }
    
}
