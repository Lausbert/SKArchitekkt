// Copyright © 2020 Stephan Lerner. All rights reserved.

import SwiftUI

@main
struct SKArchitekktExampleApp: App {
    var body: some Scene {
        DocumentGroup(newDocument: SKArchitekktExampleDocument()) { file in
            ContentView(document: file.$document)
        }
    }
}
