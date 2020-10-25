// Copyright © 2020 Stephan Lerner. All rights reserved.

import SpriteKit

extension SKLabelNode {
    convenience init(text: String, fontNamed font: String, fontSize: CGFloat, color: NSColor, shadowColor: NSColor) {
        self.init(text: "")
        
        let shadowNode = SKLabelNode(fontNamed: font)
        shadowNode.text = text
        shadowNode.fontColor = shadowColor
        shadowNode.fontSize = fontSize
        shadowNode.horizontalAlignmentMode = .center
        shadowNode.verticalAlignmentMode = .center
        let shadowOffset = 0.015 * fontSize
        shadowNode.position = CGPoint(x: shadowOffset, y: shadowOffset)
        self.addChild(shadowNode)
        
        let textNode = SKLabelNode(fontNamed: font)
        textNode.text = text
        textNode.fontColor = color
        textNode.fontSize = fontSize
        textNode.horizontalAlignmentMode = .center
        textNode.verticalAlignmentMode = .center
        self.addChild(textNode)
    }
}
