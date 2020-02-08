//  Copyright © 2019 Stephan Lerner. All rights reserved.

import Cocoa

class Application: NSApplication {

    weak var strongDelegate = AppDelegate()

    override init() {
        super.init()
        self.delegate = strongDelegate
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
