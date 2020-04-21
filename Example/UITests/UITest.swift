//  Copyright © 2019 Stephan Lerner. All rights reserved.

import XCTest

class UITest: XCTestCase {

    func testRootNodeHandlingFor(ressourceIdentifier: String, elementTreeValidationHandler: (_ elementTree: [XCUIElement]) -> Void) {
        let app = XCUIApplication()
        app.launchArguments.append("-ressourceIdentifier")
        app.launchArguments.append(ressourceIdentifier)
        app.launch()
        sleep(3600)
        elementTreeValidationHandler(app.groups["SKView"].children(matching: .image).allElementsBoundByIndex)
    }

}