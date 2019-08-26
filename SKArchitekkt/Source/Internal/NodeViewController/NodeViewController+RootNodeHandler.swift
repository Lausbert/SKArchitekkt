//  Copyright © 2019 Stephan Lerner. All rights reserved.

import Foundation
import CoreArchitekkt

extension NodeViewController: RootNodeHandler {

    // MARK: - Internal -

    func handle(rootNode: Node) {
        nodeView.handle(rootNode: rootNode)
    }

}
