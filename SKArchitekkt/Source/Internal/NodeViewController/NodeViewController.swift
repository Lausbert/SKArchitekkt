//  Copyright © 2019 Stephan Lerner. All rights reserved.

import AppKit

class NodeViewController: NSViewController {
    
    // MARK: - Internal -

    @IBOutlet weak var nodeView: NodeView!

    override func viewDidLoad() {
        super.viewDidLoad()

        nodeView.setUp()
    }

}
