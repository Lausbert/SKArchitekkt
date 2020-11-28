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
        updateNode()
    }
    
    func updateRendering(document: Document) {
        self.newSettings = document.settings
        if newSettings.visibilitySettingsDomain != oldSettings.visibilitySettingsDomain {
            self.oldSettings = self.newSettings
            updateNode()
        } else if newSettings.geometrySettingsDomain != oldSettings.geometrySettingsDomain {
            self.oldSettings = self.newSettings
            updateRadius()
        } else if newSettings.forceSettingsDomain != oldSettings.forceSettingsDomain {
            self.oldSettings = self.newSettings
            startSimulation()
        }
    }

    // MARK: - Private -

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
    
    private static let isUpdatingObjectAssociation = ObjectAssociation<Bool>()
    private var isUpdating: Bool {
        get { NodeScene.isUpdatingObjectAssociation[self] ?? false }
        set { NodeScene.isUpdatingObjectAssociation[self] = newValue }
    }
    
    private static let shouldUpdateAgainObjectAssociation = ObjectAssociation<Bool>()
    private var shouldUpdateAgain: Bool {
        get { NodeScene.shouldUpdateAgainObjectAssociation[self] ?? false }
        set { NodeScene.shouldUpdateAgainObjectAssociation[self] = newValue }
    }
    
    private var shapeNodeSettings: ShapeNode.Settings {
        ShapeNode.Settings(
            physicalRadiusMultiplier: 64.0,
            visualRadiusMultiplier: CGFloat(newSettings.visualRadiusMultiplier),
            ingoingArcsRadiusMultiplier: CGFloat(newSettings.sinkRadiusMultiplier),
            outgoingArcsRadiusMultiplier: CGFloat(newSettings.sourceRadiusMultiplier)
        )
    }
    
    private func updateRadius() {
        shapeRootNode.update(radius: shapeRootNode.radius, settings: shapeNodeSettings)
        startSimulation()
    }
    
    private func updateNode() {
        guard !isUpdating else {
            shouldUpdateAgain = true
            return
        }
        NodeScene.updateQueue.async { [weak self] in
            self?.updateNodeDoNotCallOnMainThread { (shapeNodePatch, arcNodePatch) in
                DispatchQueue.main.async {
                    guard let self = self else {
                        return
                    }
                    self.updateNodeDoOnlyCallOnMainThread(shapeNodePatch: shapeNodePatch, arcNodePatch: arcNodePatch)
                    self.startSimulation()
                    self.isUpdating = false
                    if self.shouldUpdateAgain {
                        self.shouldUpdateAgain = false
                        self.updateNode()
                    }
                }
            }
        }
    }

    private func updateNodeDoNotCallOnMainThread(completion: (((ShapeNode) -> Void, (SKNode) -> Void)) -> Void) {
        updateStatus(description: "Calculating Transformations", progress: 0.0)
        let firstOrderVirtualTransformations = document.firstOrderVirtualTransformations
        updateStatus(description: "Updating Arcs", progress: 0.25)
        let newVirtualArcs = VirtualArc.createVirtualArcs(
            from: document.node,
            with: firstOrderVirtualTransformations
        )
        let arcNodePatch = ArcNode.diffChildren(oldVirtualArcs: oldVirtualArcs, newVirtualArcs: newVirtualArcs)
        oldVirtualArcs = newVirtualArcs
        updateStatus(description: "Updating Nodes", progress: 0.5)
        let newVirtualNodes = VirtualNode.createVirtualNodes(
            from: document.node,
            with: firstOrderVirtualTransformations,
            and: newVirtualArcs
        )
        let alignedNewVirtualNodes = VirtualNode.align(newVirtualNodes: newVirtualNodes, with: oldVirtualNodes)
        let shapeNodePatch = ShapeNode.diffChildren(oldVirtualNodes: oldVirtualNodes, newVirtualNodes: alignedNewVirtualNodes, settings: shapeNodeSettings)
        oldVirtualNodes = alignedNewVirtualNodes
        completion((shapeNodePatch, arcNodePatch))
    }
    
    private func updateNodeDoOnlyCallOnMainThread(shapeNodePatch: (ShapeNode) -> Void, arcNodePatch: (SKNode) -> Void) {
        updateStatus(description: "Rendering", progress: 0.75)
        arcNodePatch(arcRootNode)
        arcNodes = []
        arcRootNode.enumerateChildNodes(withName: ArcNode.name) { (node, _) in
            if let arcNode = node as? ArcNode {
                self.arcNodes.append(arcNode)
            }
        }
        shapeNodePatch(shapeRootNode)
        shapeNodesDictionary = Dictionary(
            uniqueKeysWithValues: shapeRootNode.allDescendants.map({ ($0.id, $0) })
        )
        shapeNodesDictionary[shapeRootNode.id] = shapeRootNode
        let radius = VirtualNode.radius(for: oldVirtualNodes)
        shapeRootNode.update(radius: radius, settings: shapeNodeSettings)
    }

}
