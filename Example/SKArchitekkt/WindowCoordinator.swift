// Copyright © 2020 Stephan Lerner. All rights reserved.

import Foundation
import CoreArchitekkt
import SKArchitekkt

class WindowCoordinator: CoreArchitekkt.WindowCoordinator<Void> {
    
    // MARK: - Internal -
    
    func showGraph(rootNode: Node) {
        let graphTuple = self.graphTuple ?? open(windowController: GraphWindowController.self, with: GraphCoordinator.self)
        graphTuple.1.handle(rootNode: rootNode)
        graphTuple.0.showWindow(nil)
        self.graphTuple = graphTuple
    }
    
    // MARK: - Private -
    
    private var graphTuple: (GraphWindowController, GraphCoordinator)?
    
}
