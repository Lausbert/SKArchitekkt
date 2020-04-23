//  Copyright © 2019 Stephan Lerner. All rights reserved.

import XCTest

extension UITest {

    func testMacOSProject() {
        testRootNodeHandlingFor(ressourceIdentifier: CocoaPodsWorkspace.identifier()) { (elementTree) in
            for element in elementTree {
                print(element.label)
                print(element.frame)
            }
        }
    }

}
