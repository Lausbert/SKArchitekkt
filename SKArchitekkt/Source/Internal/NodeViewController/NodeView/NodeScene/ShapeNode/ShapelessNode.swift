// Copyright © 2020 Stephan Lerner. All rights reserved.

import Foundation

class ShapelessNode: ShapeNode {
        
    init() {
        super.init(id: UUID(), scope: "shapelessnode", name: nil, children: [], color: .clear, radius: 1000)
        name = "ShapelessNode"
        physicsBody = nil
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func update(color: NSColor) {}
    
    override func update(radius: CGFloat) {}
    
}
