// Copyright © 2020 Stephan Lerner. All rights reserved.

import Foundation

import XCTest
import CoreArchitekkt
@testable import SKArchitekkt

class VirtualArcTest: VirtualTest {
    
    func testNoTransformation() {
        let virtualArcs = sort(VirtualArc.createVirtualArcs(
            from: one,
            with: []
        ))
        
        XCTAssertEqual(virtualArcs, [])
    }
    
    func testUnfoldingOne() {
        let virtualArcs = sort(VirtualArc.createVirtualArcs(
            from: one,
            with: [
                .unfold(id: one.id)
            ]
        ))
        
        XCTAssertEqual(virtualArcs.count, 1)
        
        let arcOne = virtualArcs[0]
        XCTAssertEqual(arcOne.sourceIdentifier, two.id)
        XCTAssertEqual(arcOne.destinationIdentifier, three.id)
        XCTAssertEqual(arcOne.weight, 3)
    }
    
    func testUnfoldingOneAndTwo() {
        let virtualArcs = sort(VirtualArc.createVirtualArcs(
            from: one,
            with: [
                .unfold(id: one.id),
                .unfold(id: two.id)
            ]
        ))
        
        XCTAssertEqual(virtualArcs.count, 3)
        
        let arcOne = virtualArcs[0]
        XCTAssertEqual(arcOne.sourceIdentifier, four.id)
        XCTAssertEqual(arcOne.destinationIdentifier, three.id)
        XCTAssertEqual(arcOne.weight, 1)

        let arcTwo = virtualArcs[1]
        XCTAssertEqual(arcTwo.sourceIdentifier, four.id)
        XCTAssertEqual(arcTwo.destinationIdentifier, five.id)
        XCTAssertEqual(arcTwo.weight, 1)
        
        let arcThree = virtualArcs[2]
        XCTAssertEqual(arcThree.sourceIdentifier, five.id)
        XCTAssertEqual(arcThree.destinationIdentifier, three.id)
        XCTAssertEqual(arcThree.weight, 2)
    }
    
    func testUnfoldingOneAndTwoAndThree() {
        let virtualArcs = sort(VirtualArc.createVirtualArcs(
            from: one,
            with: [
                .unfold(id: one.id),
                .unfold(id: two.id),
                .unfold(id: three.id)
            ]
        ))
        
        XCTAssertEqual(virtualArcs.count, 4)
        
        let arcOne = virtualArcs[0]
        XCTAssertEqual(arcOne.sourceIdentifier, four.id)
        XCTAssertEqual(arcOne.destinationIdentifier, five.id)
        XCTAssertEqual(arcOne.weight, 1)

        let arcTwo = virtualArcs[1]
        XCTAssertEqual(arcTwo.sourceIdentifier, four.id)
        XCTAssertEqual(arcTwo.destinationIdentifier, six.id)
        XCTAssertEqual(arcTwo.weight, 1)
        
        let arcThree = virtualArcs[2]
        XCTAssertEqual(arcThree.sourceIdentifier, five.id)
        XCTAssertEqual(arcThree.destinationIdentifier, three.id)
        XCTAssertEqual(arcThree.weight, 1)
        
        let arcFour = virtualArcs[3]
        XCTAssertEqual(arcFour.sourceIdentifier, five.id)
        XCTAssertEqual(arcFour.destinationIdentifier, six.id)
        XCTAssertEqual(arcFour.weight, 1)

    }
    
    func testUnfoldingAll() {
        let virtualArcs = sort(VirtualArc.createVirtualArcs(
            from: one,
            with: [
                .unfold(id: one.id),
                .unfold(id: two.id),
                .unfold(id: three.id),
                .unfold(id: four.id),
                .unfold(id: five.id),
                .unfold(id: six.id),
                .unfold(id: seven.id)
            ]
        ))
        
        XCTAssertEqual(virtualArcs.count, 4)
        
        let arcOne = virtualArcs[0]
        XCTAssertEqual(arcOne.sourceIdentifier, four.id)
        XCTAssertEqual(arcOne.destinationIdentifier, five.id)
        XCTAssertEqual(arcOne.weight, 1)

        let arcTwo = virtualArcs[1]
        XCTAssertEqual(arcTwo.sourceIdentifier, four.id)
        XCTAssertEqual(arcTwo.destinationIdentifier, six.id)
        XCTAssertEqual(arcTwo.weight, 1)
        
        let arcThree = virtualArcs[2]
        XCTAssertEqual(arcThree.sourceIdentifier, five.id)
        XCTAssertEqual(arcThree.destinationIdentifier, three.id)
        XCTAssertEqual(arcThree.weight, 1)
        
        let arcFour = virtualArcs[3]
        XCTAssertEqual(arcFour.sourceIdentifier, five.id)
        XCTAssertEqual(arcFour.destinationIdentifier, six.id)
        XCTAssertEqual(arcFour.weight, 1)
    }
    
    func testUnfoldingTwo() {
        let virtualArcs = sort(VirtualArc.createVirtualArcs(
            from: one,
            with: [
                .unfold(id: two.id)
            ]
        ))
        
        XCTAssertEqual(virtualArcs, [])
    }
    
    private func sort(_ virtualArcs: [VirtualArc]) -> [VirtualArc] {
        return virtualArcs.sorted { (lhs, rhs) -> Bool in
            let lhsSourceIndex = allNodes.firstIndex(of: allNodes.first(where: { $0.id == lhs.sourceIdentifier })!)!
            let lhsDestinationIndex = allNodes.firstIndex(of: allNodes.first(where: { $0.id == lhs.destinationIdentifier })!)!
            let rhsSourceIndex = allNodes.firstIndex(of: allNodes.first(where: { $0.id == rhs.sourceIdentifier })!)!
            let rhsDestinationIndex = allNodes.firstIndex(of: allNodes.first(where: { $0.id == rhs.destinationIdentifier })!)!
            if lhsSourceIndex != rhsSourceIndex {
                return lhsSourceIndex < rhsSourceIndex
            } else {
                return lhsDestinationIndex < rhsDestinationIndex
            }
        }
    }
 
}
