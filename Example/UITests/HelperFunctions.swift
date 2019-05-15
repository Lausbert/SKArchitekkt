//  Copyright © 2019 Stephan Lerner. All rights reserved.

import XCTest

class UITests: XCTestCase {

    func testRootNodeHandlingFor(ressourceIdentifier: String, elementTreeValidationHandler: (_ elementTree: [XCUIElement]) -> Void) {
        let app = XCUIApplication()
        app.launchArguments.append("-ressourceIdentifier")
        app.launchArguments.append(ressourceIdentifier)
        app.launch()
        sleep(10)
        elementTreeValidationHandler(app.groups["SKView"].children(matching: .image).allElementsBoundByIndex)
    }

}
