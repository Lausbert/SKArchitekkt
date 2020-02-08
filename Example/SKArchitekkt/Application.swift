//  Copyright © 2019 Stephan Lerner. All rights reserved.

import Cocoa

class Application: NSApplication {

    var strongReference = AppDelegate()

    override init() {
        super.init()
        self.delegate = strongReference
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
