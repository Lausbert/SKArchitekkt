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
    
    // all values cached for performance reasons; stored here and not in extension for performance reasons
    private(set) var decayPower: CGFloat = 1.0
    private(set) var radialGravitationForceOnChildrenMultiplier: CGFloat = 1.0
    private(set) var negativeRadialGravitationalForceOnSiblingsPower: CGFloat = 1.0
    private(set) var springForceBetweenConnectedNodesPower: CGFloat = 1.0
    private(set) var physicalRadiusMultiplier: CGFloat = 1.0
    private(set) var visualRadiusMultiplier: CGFloat = 1.0
    private(set) var colorDictionary: [String: NSColor] = [:]

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateSettingsValues() {
        decayPower = CGFloat(document.settings.decayPower)
        radialGravitationForceOnChildrenMultiplier = CGFloat(document.settings.radialGravitationForceOnChildrenMultiplier)
        negativeRadialGravitationalForceOnSiblingsPower = CGFloat(document.settings.negativeRadialGravitationalForceOnSiblingsPower)
        springForceBetweenConnectedNodesPower = CGFloat(document.settings.springForceBetweenConnectedNodesPower)
        physicalRadiusMultiplier = 128.0
        visualRadiusMultiplier = CGFloat(document.settings.visualRadiusMultiplier)
        colorDictionary = [
            "module": #colorLiteral(red: 0.4745098039, green: 0.9882352941, blue: 0.9176470588, alpha: 1),
            "import_decl": #colorLiteral(red: 0.4745098039, green: 0.9882352941, blue: 0.9176470588, alpha: 1),
            "class_decl": #colorLiteral(red: 0.4392156863, green: 0.8470588235, blue: 1, alpha: 1),
            "struct_decl": #colorLiteral(red: 0.4392156863, green: 0.8470588235, blue: 1, alpha: 1),
            "enum_decl": #colorLiteral(red: 0.4392156863, green: 0.8470588235, blue: 1, alpha: 1),
            "extension_decl": #colorLiteral(red: 0.4392156863, green: 0.8470588235, blue: 1, alpha: 1),
            "var_decl": #colorLiteral(red: 0.9647058824, green: 0.4823529412, blue: 0.4705882353, alpha: 1),
            "enum_case_decl": #colorLiteral(red: 0.9647058824, green: 0.4823529412, blue: 0.4705882353, alpha: 1),
            "enum_element_decl": #colorLiteral(red: 0.9647058824, green: 0.4823529412, blue: 0.4705882353, alpha: 1),
            "func_decl": #colorLiteral(red: 0.9607843137, green: 0.768627451, blue: 0.5058823529, alpha: 1),
            "constructor_decl": #colorLiteral(red: 0.9607843137, green: 0.768627451, blue: 0.5058823529, alpha: 1),
            "destructor_decl": #colorLiteral(red: 0.9607843137, green: 0.768627451, blue: 0.5058823529, alpha: 1),
            "protocol": #colorLiteral(red: 0.8, green: 0.862745098, blue: 0.8588235294, alpha: 1)
        ]
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
        super.init(size: CGSize.zero)
        backgroundColor = NSColor.controlBackgroundColor
        setUpPhysics()
        setUpMouseInteraction()
        setUpRendering()
    }

}
