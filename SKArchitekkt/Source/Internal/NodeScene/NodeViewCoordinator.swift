//  Copyright © 2019 Stephan Lerner. All rights reserved.

import CoreArchitekkt

class NodeViewCoordinator: ViewCoordinator<HasSettings> {

    // MARK: - Internal -

    @IBOutlet weak var nodeView: NodeView!

    override func viewDidLoad() {
        super.viewDidLoad()

        if let settings = dependencies?.settings {
            nodeView.setUp(with: settings)
        } else {
            assertionFailure()
        }
    }

}
