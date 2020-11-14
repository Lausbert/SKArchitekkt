//  Copyright © 2019 Stephan Lerner. All rights reserved.

import SpriteKit
import CoreArchitekkt
import SwiftUI

class NodeScene: SKScene {

    // MARK: - Internal -
    
    static func create(document: Binding<Document>, updateStatus: UpdateStatus) -> NodeScene {
        let nodeScene = pool[document.wrappedValue.id] ?? NodeScene(document: document, updateStatus: updateStatus)
        pool[document.wrappedValue.id] = nodeScene
        return nodeScene
    }

    @Binding var document: Document
    let updateStatus: UpdateStatus
    var newSettings: CoreArchitekkt.Settings
    var oldSettings: CoreArchitekkt.Settings
    
    // all force related values cached for performance reasons; stored here and not in extension for performance reasons
    private(set) var decayPower: CGFloat = 1.0
    private(set) var radialGravitationForceOnChildrenMultiplier: CGFloat = 1.0
    private(set) var negativeRadialGravitationalForceOnSiblingsPower: CGFloat = 1.0
    private(set) var springForceBetweenConnectedNodesPower: CGFloat = 1.0
    private(set) var arcWidthMultiplier: CGFloat = 1.0

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateForceSettingsValues() {
        decayPower = CGFloat(newSettings.decayPower)
        radialGravitationForceOnChildrenMultiplier = CGFloat(newSettings.radialGravitationForceOnChildrenMultiplier)
        negativeRadialGravitationalForceOnSiblingsPower = CGFloat(newSettings.negativeRadialGravitationalForceOnSiblingsPower)
        springForceBetweenConnectedNodesPower = CGFloat(newSettings.springForceBetweenConnectedNodesPower)
        arcWidthMultiplier = CGFloat(newSettings.arcWidthMultiplier)
    }
    
    func updateStatus(description: String, progress: Double) {
        DispatchQueue.main.async { [weak self] in
            self?.updateStatus.set(description: description, progress: progress)
        }
    }
    
    // MARK: - Private -
    
    private static var pool: [UUID: NodeScene] = [:]
    
    private init(document: Binding<Document>, updateStatus: UpdateStatus) {
        self._document = document
        self.updateStatus = updateStatus
        self.newSettings = document.wrappedValue.settings
        self.oldSettings = document.wrappedValue.settings
        super.init(size: CGSize.zero)
        backgroundColor = NSColor.controlBackgroundColor
        setUpPhysics()
        setUpMouseInteraction()
        setUpRendering()
    }

}
