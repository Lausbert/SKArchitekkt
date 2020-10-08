//  Copyright © 2019 Stephan Lerner. All rights reserved.

import SpriteKit
import CoreArchitekkt
import SwiftUI

class NodeScene: SKScene {

    // MARK: - Internal -

    @Binding var document: Document
    var decayPower: CGFloat = 1.0 // cached for performance reasons
    var radialGravitationForceOnChildrenMultiplier: CGFloat = 1.0 // cached for performance reasons
    var negativeRadialGravitationalForceOnSiblingsPower: CGFloat = 1.0 // cached for performance reasons
    var springForceBetweenConnectedNodesPower: CGFloat = 1.0 // cached for performance reasons
    var areaBasedOnTotalChildrensAreaMultiplier: CGFloat = 1.0 // cached for performance reasons

    init(document: Binding<Document>) {
        self._document = document
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
