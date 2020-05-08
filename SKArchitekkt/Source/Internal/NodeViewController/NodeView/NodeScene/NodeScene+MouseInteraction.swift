//  Copyright © 2019 Stephan Lerner. All rights reserved.

import SpriteKit
import CoreArchitekkt

extension NodeScene {

    // MARK: - Internal -

    func setUpMouseInteraction() {
        let camera = SKCameraNode()
        self.camera = camera
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
                    toggleUnfoldTransformation(for: shapeNode.id)
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
        let scale = (camera?.xScale ?? 1)
        if frozenNodes.isEmpty {
            camera?.position.x -= scale*event.deltaX
            camera?.position.y += scale*event.deltaY
        } else {
            startSimulation()
            movedNode?.position.x += scale*event.deltaX
            movedNode?.position.y -= scale*event.deltaY
        }
    }

    override func mouseUp(with event: NSEvent) {
        for node in frozenNodes {
            node.physicsBody?.isDynamic = true
        }
        frozenNodes = []
        movedNode = nil
    }

    override func scrollWheel(with event: NSEvent) {
        guard let currentScale = camera?.xScale else { return }
        let newScale: CGFloat = min(max(0.2, currentScale - event.deltaY), 200)
        let roundedNewScale: CGFloat = round(10*newScale)/10
        camera?.xScale = roundedNewScale
        camera?.yScale = roundedNewScale
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

    private func nearestNodeTo(position: CGPoint, nodes: [SKNode]) -> SKNode? {
        let sortedNodes = nodes.sorted { (firstNode, secondNode) -> Bool in
            let firstRadius = (firstNode as? ShapeNode)?.radius ?? 0
            let secondRadius = (secondNode as? ShapeNode)?.radius ?? 0
            guard firstRadius == secondRadius else { return firstRadius < secondRadius } // always prefer smaller nodes over bigger
            let convertedFirstPosition = firstNode.parent?.convert(CGPoint.zero, to: self) ?? CGPoint.zero
            let convertedSecondPosition = secondNode.parent?.convert(CGPoint.zero, to: self) ?? CGPoint.zero
            return (convertedFirstPosition - position) < (convertedSecondPosition - position)
        }
        return sortedNodes.first
    }

    private func replaceNodeWithParentIfNeeded(node: SKNode?) -> SKNode? {
        var node = node
        while (node?.parent?.children.filter { $0.name == ShapeNode.name }.count ?? Int.max) <= 1 {
            node = node?.parent
        }
        return node?.name != ShapeNode.name ? nil : node
    }

}
