// Copyright © 2020 Stephan Lerner. All rights reserved.

import AppKit
import SpriteKit
import CoreArchitekkt
import Combine

extension NodeScene {

    // MARK: - Internal -
    
    private static let updateQueue = DispatchQueue(label: "SKArchikktUpdateQueue", qos: .userInteractive)

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
            self?.document.bumpVersion()
            self?.updateGraph()
        }
        let areaCancellable = document.settings.areaSettingsDomain.objectDidChange.sink { [weak self] _ in
            self?.document.bumpVersion()
            self?.updateRadius()
        }
        cancellables = [visibilityCancellable, areaCancellable]
        updateGraph()
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
    
    private var shapeNodeSettings: ShapeNode.Settings {
        ShapeNode.Settings(
            colorDictionary: colorDictionary,
            physicalRadiusMultiplier: physicalRadiusMultiplier,
            visualRadiusMultiplier: visualRadiusMultiplier
        )
    }
    
    private func updateRadius() {
        updateSettingsValues()
        ([shapeRootNode] + shapeRootNode.allDescendants).forEach { shapeNode in
            shapeNode.updateRadius(settings: shapeNodeSettings)
        }
        startSimulation()
    }
    
    private func updateGraph() {
        updateSettingsValues()
        NodeScene.updateQueue.async { [weak self] in
            self?.updateGraphDoNotCallOnMainThread { (shapeNodePatch, arcNodePatch) in
                DispatchQueue.main.async {
                    self?.updateGraphDoOnlyCallOnMainThread(shapeNodePatch: shapeNodePatch, arcNodePatch: arcNodePatch)
                    self?.startSimulation()
                }
            }
        }
    }

    private func updateGraphDoNotCallOnMainThread(completion: (((ShapeNode) -> Void, (SKNode) -> Void)) -> Void) {
        updateStatus(description: "Updating Nodes", progress: 0.2)
        let newVirtualNodes = VirtualNode.createVirtualNodes(
            from: document.node,
            with: document.settings.virtualTransformations
        )
        let alignedNewVirtualNodes = ShapeNode.align(newVirtualNodes: newVirtualNodes, with: oldVirtualNodes)
        let shapeNodePatch = ShapeNode.diffChildren(oldVirtualNodes: oldVirtualNodes, newVirtualNodes: alignedNewVirtualNodes, settings: shapeNodeSettings)
        oldVirtualNodes = alignedNewVirtualNodes
        updateStatus(description: "Updating Arcs", progress: 0.4)
        let newVirtualArcs = VirtualArc.createVirtualArcs(
            from: document.node,
            with: document.settings.virtualTransformations
        )
        let arcNodePatch = ArcNode.diffChildren(oldVirtualArcs: oldVirtualArcs, newVirtualArcs: newVirtualArcs)
        oldVirtualArcs = newVirtualArcs
        completion((shapeNodePatch, arcNodePatch))
    }
    
    private func updateGraphDoOnlyCallOnMainThread(shapeNodePatch: (ShapeNode) -> Void, arcNodePatch: (SKNode) -> Void) {
        updateStatus(description: "Rendering Nodes", progress: 0.6)
        shapeNodePatch(shapeRootNode)
        shapeNodesDictionary = Dictionary(
            uniqueKeysWithValues: shapeRootNode.allDescendants.map({ ($0.id, $0) })
        )
        shapeNodesDictionary[shapeRootNode.id] = shapeRootNode
        let radius = VirtualNode.radius(for: oldVirtualNodes)
        shapeRootNode.updateRadius(radius: radius, settings: shapeNodeSettings)
        updateStatus(description: "Rendering Arcs", progress: 0.8)
        arcNodePatch(arcRootNode)
        arcNodes = []
        arcRootNode.enumerateChildNodes(withName: ArcNode.name) { (node, _) in
            if let arcNode = node as? ArcNode {
                self.arcNodes.append(arcNode)
            }
        }
    }

}
