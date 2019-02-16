//  Copyright © 2019 Stephan Lerner. All rights reserved.

import AppKit

class NodeViewController: NSViewController {
    
    @IBOutlet weak var nodeView: NodeView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpView()
    }
    
}

private extension NodeViewController {
    
    func setUpView() {
        nodeView.ignoresSiblingOrder = true
        #if DEBUG
        nodeView.showsFPS = true
        #endif
        
        let scene = NodeScene()
        scene.scaleMode = .resizeFill
        nodeView.presentScene(scene)
    }
    
}
