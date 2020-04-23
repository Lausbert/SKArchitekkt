//  Copyright © 2019 Stephan Lerner. All rights reserved.

import SpriteKit
import CoreArchitekkt

class NodeScene: SKScene {

    // MARK: - Internal -

    let settings: Settings
    var rootNode: Node?
    var virtualTransformations: Set<VirtualTransformation> = []
    var shapeNodeChildren: [ShapeNode] = []
    var shapeNodesDictionary: [UUID: ShapeNode] = [:]
    var arcNodes: [ArcNode] = []

    init(with settings: Settings) {
        self.settings = settings
        super.init(size: CGSize.zero)
        self.settingsItemObservations = settings.settingsItems.map({ [weak self] (settingsItem) -> NSKeyValueObservation in
            return settingsItem.observe(\.value) { (_, _) in
                self?.startSimulation()
                self?.applyRandomForceToAllCastedChildren()
            }
        })
        self.radiusRelatedSettingsItemObservations = [
            settings.areaBasedOnTotalChildrensAreaMultiplierSettingsItem,
            settings.areaBasedOnTotalChildrensAreaPowerSettingsItem
            ].map { [weak self] (settingsItem) -> NSKeyValueObservation in
                return settingsItem.observe(\.value) { (_, _) in
                    self?.update()
                }
        }
        delegate = self
        backgroundColor = NSColor.controlBackgroundColor
        setUpPhysicsWorld()
        setUpCamera()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func add(rootNode: Node) {
        self.rootNode = rootNode
        update()
    }
    
    func update() {
        guard let rootNode = rootNode else {
            assertionFailure()
            return
        }
        if let item = updateDispatchWorkItem {
            item.cancel()
        }
        updateDispatchWorkItem = DispatchWorkItem(block: {
            #warning("Todo: Integrate colorDictionary in settings.")
            let colorDictionary: [String: NSColor] = [
               "struct_decl": #colorLiteral(red: 0.4392156863, green: 0.8470588235, blue: 1, alpha: 1),
               "class_decl": #colorLiteral(red: 0.4392156863, green: 0.8470588235, blue: 1, alpha: 1),
               "protocol": #colorLiteral(red: 0.8, green: 0.862745098, blue: 0.8588235294, alpha: 1),
               "var_decl": #colorLiteral(red: 0.9647058824, green: 0.4823529412, blue: 0.4705882353, alpha: 1),
               "enum_decl": #colorLiteral(red: 0.4392156863, green: 0.8470588235, blue: 1, alpha: 1),
               "func_decl": #colorLiteral(red: 0.9607843137, green: 0.768627451, blue: 0.5058823529, alpha: 1),
               "module": #colorLiteral(red: 0.4745098039, green: 0.9882352941, blue: 0.9176470588, alpha: 1)
            ]
            let virtualNodeSettings = VirtualNode.Settings(
               colorDictionary: colorDictionary,
               defaultColor: .windowFrameColor,
               baseRadius: 128,
               areaMultiplier: CGFloat(self.settings.areaBasedOnTotalChildrensAreaMultiplierSettingsItem.value),
               areaPower: CGFloat(self.settings.areaBasedOnTotalChildrensAreaPowerSettingsItem.value)
            )
            let virtualChildren = VirtualNode.createVirtualNodes(
                from: rootNode,
                with: self.virtualTransformations,
                and: virtualNodeSettings
            )
            let oldCastedChildren = self.shapeNodeChildren
            self.shapeNodeChildren = ShapeNode.render(virtualChildren)
            self.shapeNodesDictionary = Dictionary(
                uniqueKeysWithValues: (self.shapeNodeChildren + self.shapeNodeChildren.flatMap({ $0.allDescendants })).map({ ($0.id, $0) })
            )
            oldCastedChildren.forEach { $0.removeFromParent() }
            self.shapeNodeChildren.forEach { self.scene?.addChild($0) }
            let virtualArcs = VirtualArc.createVirtualArcs(
                from: rootNode,
                with: self.virtualTransformations
            )
            let oldArcs = self.arcNodes
            self.arcNodes = ArcNode.render(virtualArcs)
            oldArcs.forEach { $0.removeFromParent() }
            self.arcNodes.forEach { self.scene?.addChild($0) }
        })
        if let item = updateDispatchWorkItem {
            DispatchQueue.main.async(execute: item)
        }
    }
    
    func toggleUnfoldTransformation(for id: UUID) {
        let virtualTransformation = VirtualTransformation.unfold(id: id)
        if virtualTransformations.contains(virtualTransformation) {
            virtualTransformations.remove(virtualTransformation)
        } else {
            virtualTransformations.insert(virtualTransformation)
        }
        update()
    }

    // MARK: - Private -

    private var settingsItemObservations: [NSKeyValueObservation] = []
    private var radiusRelatedSettingsItemObservations: [NSKeyValueObservation] = []
    private var updateDispatchWorkItem: DispatchWorkItem?

    private func applyRandomForceToAllCastedChildren() {
        for shapeNode in shapeNodeChildren.flatMap({ $0.allDescendants }) {
            let force = CGVector(dx: CGFloat.random(in: -(shapeNode.radius^^3)...shapeNode.radius^^3), dy: CGFloat.random(in: -(shapeNode.radius^^3)...shapeNode.radius^^3))
            shapeNode.physicsBody?.applyImpulse(force)
        }
    }
    
    private func createArcNode() -> SKShapeNode {
        let arcNode = SKShapeNode()
        arcNode.fillColor = .windowFrameColor
        arcNode.strokeColor = .windowFrameColor
        arcNode.alpha = 0.5
        arcNode.zPosition = -1
        return arcNode
    }

}




    
