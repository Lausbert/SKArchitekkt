// Copyright © 2020 Stephan Lerner. All rights reserved.

import SwiftUI
import CoreArchitekkt
import SKArchitekkt

@main
struct SKArchitekktExampleApp: App {
    var body: some Scene {
        DocumentGroup(newDocument: Document(node: <#T##Node?#>)) { file in
            SKArchitekktView(document: file.$document)
        }
    }
}
