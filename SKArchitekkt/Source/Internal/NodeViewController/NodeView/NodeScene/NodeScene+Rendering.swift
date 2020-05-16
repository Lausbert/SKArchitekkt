// Copyright © 2020 Stephan Lerner. All rights reserved.

import SpriteKit
import CoreArchitekkt
import Combine

extension NodeScene {

    // MARK: - Internal -

    private static let shapeRootNodeObjectAssociation = ObjectAssociation<ShapeNode>()
    private(set) var shapeRootNode: ShapeNode {
        get { NodeScene.shapeRootNodeObjectAssociation[self] ?? ShapeNode.create(radius: 10000, isShape: false) }
        set { NodeScene.shapeRootNodeObjectAssociation[self] = newValue }
    }

    private static let shapeNodesDictionaryObjectAssociation = ObjectAssociation<[UUID: ShapeNode]>()
    private(set) var shapeNodesDictionary: [UUID: ShapeNode] {
        get { NodeScene.shapeNodesDictionaryObjectAssociation[self] ?? [:] }
        set { NodeScene.shapeNodesDictionaryObjectAssociation[self] = newValue }
    }

    private static let arcNodesObjectAssociation = ObjectAssociation<[ArcNode]>()
    private(set) var arcNodes: [ArcNode] {
        get { NodeScene.arcNodesObjectAssociation[self] ?? [] }
        set { NodeScene.arcNodesObjectAssociation[self] = newValue }
    }

    func setUpRendering() {
        virtualTransformations = []
        oldVirtualNodes = []
        shapeRootNode = ShapeNode.create(radius: 10000, isShape: false)
        shapeNodesDictionary = [:]
        oldVirtualArcs = []
        arcRootNode = SKNode()
        arcNodes = []
        scene?.addChild(shapeRootNode)
        scene?.addChild(arcRootNode)
        self.areaBasedOnTotalChildrensAreaMultiplierSettingsItemCancellable = settings.areaBasedOnTotalChildrensAreaMultiplierSettingsItem.$value.receive(on: DispatchQueue.main).sink(receiveValue: { [weak self] (_) in
                self?.update()
        })
    }

    func add(rootNode: Node) {
        self.rootNode = rootNode
        update()
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

    private static let areaBasedOnTotalChildrensAreaMultiplierSettingsItemCancellableObjectAssociation = ObjectAssociation<AnyCancellable>()
    private var areaBasedOnTotalChildrensAreaMultiplierSettingsItemCancellable: AnyCancellable? {
        get { NodeScene.areaBasedOnTotalChildrensAreaMultiplierSettingsItemCancellableObjectAssociation[self] }
        set { NodeScene.areaBasedOnTotalChildrensAreaMultiplierSettingsItemCancellableObjectAssociation[self] = newValue }
    }

    private static let rootNodeObjectAssociation = ObjectAssociation<Node>()
    private var rootNode: Node? {
        get { NodeScene.rootNodeObjectAssociation[self] }
        set { NodeScene.rootNodeObjectAssociation[self] = newValue }
    }

    private static let virtualTransformationsObjectAssociation = ObjectAssociation<Set<VirtualTransformation>>()
    private var virtualTransformations: Set<VirtualTransformation> {
        get { NodeScene.virtualTransformationsObjectAssociation[self] ?? [] }
        set { NodeScene.virtualTransformationsObjectAssociation[self] = newValue }
    }

    private static let oldVirtualNodesObjectAssociation = ObjectAssociation<[VirtualNode]>()
    private(set) var oldVirtualNodes: [VirtualNode] {
        get { NodeScene.oldVirtualNodesObjectAssociation[self] ?? [] }
        set { NodeScene.oldVirtualNodesObjectAssociation[self] = newValue }
    }

    private static let oldVirtualArcsObjectAssociation = ObjectAssociation<[VirtualArc]>()
    private(set) var oldVirtualArcs: [VirtualArc] {
        get { NodeScene.oldVirtualArcsObjectAssociation[self] ?? [] }
        set { NodeScene.oldVirtualArcsObjectAssociation[self] = newValue }
    }

    private static let arcRootNodeObjectAssociation = ObjectAssociation<SKNode>()
    private var arcRootNode: SKNode {
        get { NodeScene.arcRootNodeObjectAssociation[self] ?? SKNode() }
        set { NodeScene.arcRootNodeObjectAssociation[self] = newValue }
    }

    private func update() {
        guard let rootNode = rootNode else {
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
           areaMultiplier: CGFloat(settings.areaBasedOnTotalChildrensAreaMultiplier)
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

}
