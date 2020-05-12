// Copyright © 2020 Stephan Lerner. All rights reserved.

import Foundation
import CoreArchitekkt
import SKArchitekkt

class WindowCoordinator: CoreArchitekkt.WindowCoordinator<Any> {

    // MARK: - Internal -

    func showGraph(rootNode: Node) {
        let graphTuple = self.graphTuple ?? open(
            windowController: GraphWindowController.self,
            with: GraphCoordinator.self,
            inheritDependencies: false,
            preferredContentSize: CGSize(width: 800, height: 800)
        )
        graphTuple.1.handle(rootNode: rootNode)
        self.graphTuple = graphTuple
    }

    // MARK: - Private -

    private var graphTuple: (GraphWindowController, GraphCoordinator)?

}
