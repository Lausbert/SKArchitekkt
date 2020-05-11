//  Copyright © 2019 Stephan Lerner. All rights reserved.

import Foundation
import CoreArchitekkt

extension GraphCoordinator: RootNodeHandler {

    // MARK: - Public -

    public func handle(rootNode: Node) {
        (children.filter { $0 is NodeViewController }.first as? NodeViewController)?.handle(rootNode: rootNode)
    }

}
