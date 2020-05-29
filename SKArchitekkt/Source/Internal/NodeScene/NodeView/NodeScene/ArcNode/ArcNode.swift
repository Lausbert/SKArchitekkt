// Copyright © 2020 Stephan Lerner. All rights reserved.

import SpriteKit

class ArcNode: SKShapeNode {

    // MARK: - Internal -

    static let name = "ArcNode"

    let sourceIdentifier: UUID
    let destinationIdentifier: UUID
    let weight: Int

    init(sourceIdentifier: UUID, destinationIdentifier: UUID, weight: Int) {
        self.sourceIdentifier = sourceIdentifier
        self.destinationIdentifier = destinationIdentifier
        self.weight = weight
        super.init()
        self.name = ArcNode.name
        self.zPosition = 10
        self.fillColor = NSColor.windowFrameColor.withAlphaComponent(0.8)
        self.strokeColor = NSColor.windowFrameColor.withAlphaComponent(0.8)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
