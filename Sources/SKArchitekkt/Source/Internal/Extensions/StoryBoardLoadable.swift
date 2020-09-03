// Copyright © 2020 Stephan Lerner. All rights reserved.

import AppKit
import CoreArchitekkt

extension StoryBoardLoadable where Self: NSResponder {

    public static func createFromStoryBoard() -> Self {
        let name = String(describing: Self.self)
        let bundle = Bundle.module
        let storyBoard = NSStoryboard.init(name: name, bundle: bundle)
        let viewController = storyBoard.instantiateController(withIdentifier: name) as? Self ?? Self()
        return viewController
    }

}
