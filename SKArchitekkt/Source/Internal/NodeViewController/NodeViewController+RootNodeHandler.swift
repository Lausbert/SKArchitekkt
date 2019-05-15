//  Copyright © 2019 Stephan Lerner. All rights reserved.

import Foundation
import CoreArchitekkt

extension NodeViewController: RootNodeHandler {

    func handle(rootNode: Node) {
        #warning("remove workarround when performance issues are gone")
        ([rootNode] + rootNode.allDescendants).forEach {
            $0.set(children: $0.children.filter({ $0.scope != "unknown" }))
            $0.set(arcs: $0.arcs.filter({ $0.scope != "unknown" }))
        }
        nodeView.handle(rootNode: rootNode)
    }

}
