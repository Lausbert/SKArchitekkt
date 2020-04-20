// Copyright © 2020 Stephan Lerner. All rights reserved.

import XCTest
import CoreArchitekkt
@testable import SKArchitekkt

extension VirtualTest {
    
    func testNoTransformation() {
        let virtualNodes = VirtualNode.createVirtualNodes(from: one, with: [], and: defaultSettings)
        XCTAssertEqual(virtualNodes.count, 1)
        let one = virtualNodes[0]
        XCTAssertEqual(one.scope, "one")
        XCTAssertEqual(one.name, "one")
        XCTAssertEqual(one.color, .black)
        XCTAssertEqual(one.children.count, 0)
    }
    
    func testUnfoldingOne() {
        let virtualNodes = VirtualNode.createVirtualNodes(from: one, with: [.unfold(id: one.id)], and: defaultSettings)
        XCTAssertEqual(virtualNodes.count, 1)
        let one = virtualNodes[0]
        XCTAssertEqual(one.children.count, 2)
    }

}
