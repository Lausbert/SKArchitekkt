//  Copyright © 2019 Stephan Lerner. All rights reserved.

import Foundation
import CoreArchitekkt

extension NodeView: RootNodeHandler {

    // MARK: - Public -

    public func handle(rootNode: Node) {
        (scene as? NodeScene)?.add(rootNode: rootNode)
    }

}
