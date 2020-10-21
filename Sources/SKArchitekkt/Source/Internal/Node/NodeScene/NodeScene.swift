//  Copyright © 2019 Stephan Lerner. All rights reserved.

import SpriteKit
import CoreArchitekkt
import SwiftUI

class NodeScene: SKScene {

    // MARK: - Internal -

    @Binding var document: Document
    let updateStatus: UpdateStatus
    private(set) var decayPower: CGFloat = 1.0 // cached for performance reasons; stored here and not in extension for performance reasons
    private(set) var radialGravitationForceOnChildrenMultiplier: CGFloat = 1.0 // cached for performance reasons; stored here and not in extension for performance reasons
    private(set) var negativeRadialGravitationalForceOnSiblingsPower: CGFloat = 1.0 // cached for performance reasons; stored here and not in extension for performance reasons
    private(set) var springForceBetweenConnectedNodesPower: CGFloat = 1.0 // cached for performance reasons; stored here and not in extension for performance reasons
    private(set) var areaBasedOnTotalChildrensAreaMultiplier: CGFloat = 1.0 // cached for performance reasons; stored here and not in extension for performance reasons

    init(document: Binding<Document>, updateStatus: UpdateStatus) {
        self._document = document
        self.updateStatus = updateStatus
        super.init(size: CGSize.zero)
        backgroundColor = NSColor.controlBackgroundColor
        setUpPhysics()
        setUpMouseInteraction()
        setUpRendering()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateSettingsValues() {
        decayPower = CGFloat(document.settings.decayPower)
        radialGravitationForceOnChildrenMultiplier = CGFloat(document.settings.radialGravitationForceOnChildrenMultiplier)
        negativeRadialGravitationalForceOnSiblingsPower = CGFloat(document.settings.negativeRadialGravitationalForceOnSiblingsPower)
        springForceBetweenConnectedNodesPower = CGFloat(document.settings.springForceBetweenConnectedNodesPower)
        areaBasedOnTotalChildrensAreaMultiplier = CGFloat(document.settings.areaBasedOnTotalChildrensAreaMultiplier)
    }

}
