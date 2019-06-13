//  Copyright © 2019 Stephan Lerner. All rights reserved.

import AppKit

class NodeViewController: NSViewController {

    @IBOutlet weak var nodeView: NodeView!

    override func viewDidLoad() {
        super.viewDidLoad()

        nodeView.setUp()
    }

}
