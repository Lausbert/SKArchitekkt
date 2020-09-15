// Copyright © 2020 Stephan Lerner. All rights reserved.

import AppKit
import SpriteKit
import CoreArchitekkt
import Combine

extension NodeScene {

    // MARK: - Internal -

    private static let shapeRootNodeObjectAssociation = ObjectAssociation<ShapeNode>()
    private(set) var shapeRootNode: ShapeNode {
        get { NodeScene.shapeRootNodeObjectAssociation[self] ?? ShapeNode.create(isShape: false) }
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
        oldVirtualNodes = []
        shapeRootNode = ShapeNode.create(isShape: false)
        shapeNodesDictionary = [:]
        oldVirtualArcs = []
        arcRootNode = SKNode()
        arcNodes = []
        scene?.addChild(shapeRootNode)
        scene?.addChild(arcRootNode)
        let visibilityCancellable = document.settings.visibilitySettingsDomain.objectDidChange.sink { [weak self] _ in
            self?.update()
            self?.startSimulation()
            self?.document.incrementVersion()
        }
        let areaCancellable = document.settings.areaSettingsDomain.objectDidChange.sink { [weak self] _ in
            self?.update()
            self?.startSimulation()
            self?.document.incrementVersion()
        }
        cancellables = [visibilityCancellable, areaCancellable]
        update()
    }

    // MARK: - Private -

    private static let cancellablesObjectAssociation = ObjectAssociation<[AnyCancellable]>()
    private var cancellables: [AnyCancellable] {
        get { NodeScene.cancellablesObjectAssociation[self] ?? [] }
        set { NodeScene.cancellablesObjectAssociation[self] = newValue }
    }

    private static let rootNodeObjectAssociation = ObjectAssociation<Node>()
    private var rootNode: Node? {
        get { NodeScene.rootNodeObjectAssociation[self] }
        set { NodeScene.rootNodeObjectAssociation[self] = newValue }
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
        #warning("TODO: Integrate color settings.")
        let colorDictionary: [String: NSColor] = [
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
        let virtualNodeSettings = VirtualNode.Settings(
           colorDictionary: colorDictionary,
            defaultColor: .gray,
           baseRadius: 128,
            areaMultiplier: CGFloat(document.settings.areaBasedOnTotalChildrensAreaMultiplier)
        )
        let newVirtualNodes = VirtualNode.createVirtualNodes(
            from: document.node,
            with: document.settings.virtualTransformations,
            and: virtualNodeSettings
        )
        let shapeNodePatch = ShapeNode.diffChildren(oldVirtualNodes: oldVirtualNodes, newVirtualNode: newVirtualNodes)
        shapeNodePatch(shapeRootNode)
        oldVirtualNodes = newVirtualNodes
        shapeNodesDictionary = Dictionary(
            uniqueKeysWithValues: shapeRootNode.allDescendants.map({ ($0.id, $0) })
        )
        shapeNodesDictionary[shapeRootNode.id] = shapeRootNode
        let radius = max(virtualNodeSettings.baseRadius, (sqrt(virtualNodeSettings.areaMultiplier*shapeRootNode.castedChildren.map {$0.radius^^2} .reduce(0, +))))
        shapeRootNode.update(radius: radius)
        let newVirtualArcs = VirtualArc.createVirtualArcs(
            from: document.node,
            with: document.settings.virtualTransformations
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
