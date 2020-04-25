//  Copyright © 2019 Stephan Lerner. All rights reserved.

import SpriteKit
import CoreArchitekkt

class NodeScene: SKScene {

    // MARK: - Internal -

    let settings: Settings
    var rootNode: Node?
    var virtualTransformations: Set<VirtualTransformation> = []
    
    var oldVirtualNodes: [VirtualNode] = []
    let shapeRootNode = ShapelessNode()
    var shapeNodesDictionary: [UUID: ShapeNode] = [:]
    
    var oldVirtualArcs: [VirtualArc] = []
    let arcRootNode = SKNode()
    var arcNodes: [ArcNode] = []
    
    init(with settings: Settings) {
        self.settings = settings
        super.init(size: CGSize.zero)
        self.settingsItemObservations = settings.settingsItems.map({ [weak self] (settingsItem) -> NSKeyValueObservation in
            return settingsItem.observe(\.value) { (_, _) in
                self?.startSimulation()
                self?.applyRandomForceToAllShapeNodeDescendants()
            }
        })
        self.radiusRelatedSettingsItemObservations = [
            settings.areaBasedOnTotalChildrensAreaMultiplierSettingsItem
            ].map { [weak self] (settingsItem) -> NSKeyValueObservation in
                return settingsItem.observe(\.value) { (_, _) in
                    self?.update()
                }
        }
        delegate = self
        backgroundColor = NSColor.controlBackgroundColor
        setUpPhysicsWorld()
        setUpCamera()
        
        scene?.addChild(shapeRootNode)
        scene?.addChild(arcRootNode)
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
           areaMultiplier: CGFloat(settings.areaBasedOnTotalChildrensAreaMultiplierSettingsItem.value)
        )
        let newVirtualNodes = VirtualNode.createVirtualNodes(
            from: rootNode,
            with: virtualTransformations,
            and: virtualNodeSettings
        )
        let shapeNodePatch = ShapeNode.diffChildren(oldVirtualNodes: oldVirtualNodes, newVirtualNode: newVirtualNodes)
        shapeNodePatch(shapeRootNode)
        oldVirtualNodes = newVirtualNodes
        shapeNodesDictionary = Dictionary(
            uniqueKeysWithValues: shapeRootNode.allDescendants.map({ ($0.id, $0) })
        )
        let newVirtualArcs = VirtualArc.createVirtualArcs(
            from: rootNode,
            with: virtualTransformations
        )
        let arcNodePatch = ArcNode.diffChildren(oldVirtualArcs: oldVirtualArcs, newVirtualArcs: newVirtualArcs)
        arcNodePatch(arcRootNode)
        oldVirtualArcs = newVirtualArcs
        arcNodes = []
        arcRootNode.enumerateChildNodes(withName: ArcNode.name) { (node, _) in
            if let arcNode = node as? ArcNode {
                self.arcNodes.append(arcNode)
            }
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

    private func applyRandomForceToAllShapeNodeDescendants() {
        for shapeNode in shapeRootNode.castedChildren.flatMap({ $0.allDescendants }) {
            let force = CGVector(dx: CGFloat.random(in: -(shapeNode.radius^^3)...shapeNode.radius^^3), dy: CGFloat.random(in: -(shapeNode.radius^^3)...shapeNode.radius^^3))
            shapeNode.physicsBody?.applyImpulse(force)
        }
    }

}




    
