//  Copyright © 2019 Stephan Lerner. All rights reserved.

import SpriteKit
import CoreArchitekkt

extension NodeScene {

    // MARK: - Internal -

    func setUpMouseInteraction() {
        let camera = SKCameraNode()
        self.camera = camera
        camera.xScale = 20
        camera.yScale = 20
        addChild(camera)
        movedNode = nil
        frozenNodes = []
    }

    override func mouseDown(with event: NSEvent) {
        let position = event.location(in: self)
        let nodes = self.nodes(at: position).filter { $0.name == ShapeNode.name }
        let clickedNode = nearestNodeTo(position: position, nodes: nodes)
        if !nodes.isEmpty {
            switch event.clickCount {
            case 1:
                for node in nodes {
                    node.physicsBody?.isDynamic = false
                    frozenNodes.append(node)
                }
                movedNode = replaceNodeWithParentIfNeeded(node: clickedNode)
            case 2:
                if let shapeNode = clickedNode as? ShapeNode {
                    toggle(virtualTransformation: .unfoldNode(id: shapeNode.id), withName: shapeNode.nodeName ?? shapeNode.scope)
                } else {
                    assertionFailure()
                }
                startSimulation()
            default:
                startSimulation()
            }
        }
    }

    override func mouseDragged(with event: NSEvent) {
        guard let movedNode = self.movedNode, let scale = camera?.xScale else { return }
        startSimulation()
        movedNode.position.x += scale*event.deltaX
        movedNode.position.y -= scale*event.deltaY
}

    override func mouseUp(with event: NSEvent) {
        for node in frozenNodes {
            node.physicsBody?.isDynamic = true
        }
        frozenNodes = []
        movedNode = nil
    }

    override func rightMouseDown(with event: NSEvent) {
        let position = event.location(in: self)
        let nodes = self.nodes(at: position).filter { $0.name == ShapeNode.name }
        guard let clickedNode = nearestNodeTo(position: position, nodes: nodes) as? ShapeNode, !clickedNode.scope.isEmpty else {
            return
        }
        guard let view = view else {
            assertionFailure()
            return
        }
        if !nodes.isEmpty {
            switch event.clickCount {
            case 1:
                focusedNode = clickedNode
                let menu = NSMenu()
                let unfoldNodePrefix = document.secondOrderVirtualTransformations.contains(.unfoldNode(id: clickedNode.id)) ? "Fold" : "Unfold"
                let unfoldNodeItem = NSMenuItem(title: "\(unfoldNodePrefix) \(clickedNode.nodeName ?? clickedNode.scope)", action: #selector(unfoldNode), keyEquivalent: "")
                unfoldNodeItem.target = self
                menu.insertItem(unfoldNodeItem, at: 0)
                let hideNodeItem = NSMenuItem(title: "Hide \(clickedNode.nodeName ?? clickedNode.scope)", action: #selector(hideNode), keyEquivalent: "")
                hideNodeItem.target = self
                menu.insertItem(hideNodeItem, at: 1)
                let flattenNodeItem = NSMenuItem(title: "Flatten \(clickedNode.nodeName ?? clickedNode.scope)", action: #selector(flattenNode), keyEquivalent: "")
                flattenNodeItem.target = self
                menu.insertItem(flattenNodeItem, at: 2)
                let separator = NSMenuItem.separator()
                menu.insertItem(separator, at: 3)
                let unfoldScopePrefix = document.secondOrderVirtualTransformations.contains(.unfoldScope(scope: clickedNode.scope)) ? "Fold" : "Unfold"
                let unfoldScopeItem = NSMenuItem(title: "\(unfoldScopePrefix) all \(clickedNode.scope)'s", action: #selector(unfoldScope), keyEquivalent: "")
                unfoldScopeItem.target = self
                menu.insertItem(unfoldScopeItem, at: 4)
                let hideScopeItem = NSMenuItem(title: "Hide all \(clickedNode.scope)'s", action: #selector(hideScope), keyEquivalent: "")
                hideScopeItem.target = self
                menu.insertItem(hideScopeItem, at: 5)
                let flattenScopeItem = NSMenuItem(title: "Flatten all \(clickedNode.scope)'s", action: #selector(flattenScope), keyEquivalent: "")
                flattenScopeItem.target = self
                menu.insertItem(flattenScopeItem, at: 6)
                menu.popUp(positioning: nil, at: view.convert(event.location(in: self), from: self), in: view)
            default:
                break
            }
        }
    }

    override func scrollWheel(with event: NSEvent) {
        guard let scale = camera?.xScale else { return }
        camera?.position.x -= 5*scale*event.deltaX
        camera?.position.y += 5*scale*event.deltaY
    }

    override func magnify(with event: NSEvent) {
        guard event.phase == .changed, let camera = camera else { return }
        let scale: CGFloat = min(max(0.2, camera.xScale*(1-event.magnification)), 200)
        camera.xScale = scale
        camera.yScale = scale
    }

    // MARK: - Private -

    private static let movedNodeObjectAssociation = ObjectAssociation<SKNode?>()
    private var movedNode: SKNode? {
        get { return NodeScene.movedNodeObjectAssociation[self] ?? nil }
        set { NodeScene.movedNodeObjectAssociation[self] = newValue }
    }
    private static let frozenNodesObjectAssociation = ObjectAssociation<[SKNode]>()
    private var frozenNodes: [SKNode] {
        get { return NodeScene.frozenNodesObjectAssociation[self] ?? [] }
        set { NodeScene.frozenNodesObjectAssociation[self] = newValue }
    }
    private static let focusedNodeObjectAssociation = ObjectAssociation<ShapeNode?>()
    private var focusedNode: ShapeNode? {
        get { return NodeScene.focusedNodeObjectAssociation[self] ?? nil }
        set { NodeScene.focusedNodeObjectAssociation[self] = newValue }
    }

    private func nearestNodeTo(position: CGPoint, nodes: [SKNode]) -> SKNode? {
        let sortedNodes = nodes.sorted { (firstNode, secondNode) -> Bool in
            let firstPhysicalRadius = (firstNode as? ShapeNode)?.physicalRadius ?? 0
            let secondPhysicalRadius = (secondNode as? ShapeNode)?.physicalRadius ?? 0
            guard firstPhysicalRadius == secondPhysicalRadius else { return firstPhysicalRadius < secondPhysicalRadius } // always prefer smaller nodes over bigger
            let convertedFirstPosition = firstNode.parent?.convert(CGPoint.zero, to: self) ?? CGPoint.zero
            let convertedSecondPosition = secondNode.parent?.convert(CGPoint.zero, to: self) ?? CGPoint.zero
            return (convertedFirstPosition - position) < (convertedSecondPosition - position)
        }
        return sortedNodes.first
    }

    private func replaceNodeWithParentIfNeeded(node: SKNode?) -> SKNode? {
        var node = node
        while let parent = node?.parent, parent.name == ShapeNode.name, parent.children.filter({ $0.name == ShapeNode.name }).count <= 1 {
            node = parent
        }
        return node
    }

    @objc private func unfoldNode() {
        guard let focusedNode = focusedNode else {
            assertionFailure()
            return
        }
        toggle(virtualTransformation: .unfoldNode(id: focusedNode.id), withName: focusedNode.nodeName ?? focusedNode.scope)
    }

    @objc private func hideNode() {
        guard let focusedNode = focusedNode else {
            assertionFailure()
            return
        }
        toggle(virtualTransformation: .hideNode(id: focusedNode.id), withName: focusedNode.nodeName ?? focusedNode.scope)
    }

    @objc private func flattenNode() {
        guard let focusedNode = focusedNode else {
            assertionFailure()
            return
        }
        toggle(virtualTransformation: .flattenNode(id: focusedNode.id), withName: focusedNode.nodeName ?? focusedNode.scope)
    }

    @objc private func unfoldScope() {
        guard let focusedNode = focusedNode else {
            assertionFailure()
            return
        }
        toggle(virtualTransformation: .unfoldScope(scope: focusedNode.scope), withName: focusedNode.scope)
    }

    @objc private func hideScope() {
        guard let focusedNode = focusedNode else {
            assertionFailure()
            return
        }
        toggle(virtualTransformation: .hideScope(scope: focusedNode.scope), withName: focusedNode.scope)
    }

    @objc private func flattenScope() {
        guard let focusedNode = focusedNode else {
            assertionFailure()
            return
        }
        toggle(virtualTransformation: .flattenScope(scope: focusedNode.scope), withName: focusedNode.scope)
    }
    
    private func toggle(virtualTransformation: SecondOrderVirtualTransformation, withName name: String) {
        let settingsValue = SettingsValue.deletable(virtualTransformation: virtualTransformation)
        let settingsItem = SettingsItem(name: name, value: settingsValue)
        document.settings.toggle(settingsItem: settingsItem)
    }

}
