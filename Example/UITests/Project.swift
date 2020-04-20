//  Copyright © 2019 Stephan Lerner. All rights reserved.

import XCTest

extension UITest {

    func testMacOSProject() {
        testRootNodeHandlingFor(ressourceIdentifier: MacOSProject.identifier()) { (elementTree) in
            for element in elementTree {
                print(element.label)
                print(element.frame)
            }
        }
    }

    func testIOSProject() {
        testRootNodeHandlingFor(ressourceIdentifier: IOSProject.identifier()) { (elementTree) in
            for element in elementTree {
                print(element.label)
                print(element.frame)
            }
        }
    }

}
