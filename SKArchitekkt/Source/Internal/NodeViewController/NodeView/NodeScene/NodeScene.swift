//  Copyright © 2019 Stephan Lerner. All rights reserved.

import SpriteKit
import CoreArchitekkt

class NodeScene: SKScene {

    // MARK: - Internal -

    struct Arc: Hashable {
        let from: Node
        let to: Node
    }

    let settings: Settings

    private(set) var castedChildren: Set<ShapeNode> = []
    private(set) var shapeNodeForNodeDictionary: [Node: ShapeNode] = [:]
    private(set) var arcNodeForArcDictionary: [Arc: SKShapeNode] = [:]

    init(with settings: Settings) {
        self.settings = settings
        super.init(size: CGSize.zero)
        self.settingsItemObservations = settings.settingsItems.map({ [weak self] (settingsItem) -> NSKeyValueObservation in
            return settingsItem.observe(\.value) { (_, _) in
                self?.startSimulation()
                self?.applyRandomForceToAllCastedChildren()
            }
        })
        delegate = self
        backgroundColor = NSColor.controlBackgroundColor
        setUpPhysicsWorld()
        setUpCamera()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func add(rootNode: Node) {
        #warning("Todo: Integrate colorDictionary in settings.")
        let colorDictionary: [String: NSColor] = [
            "1": #colorLiteral(red: 0.3293760121, green: 0.329436779, blue: 0.3293679655, alpha: 1),
            "class_decl": .color(named: "primary2"),
            "": #colorLiteral(red: 0.3293760121, green: 0.329436779, blue: 0.3293679655, alpha: 1),
            "protocol": .color(named: "tertiary"),
            "var_decl": .color(named: "secondary1"),
            "source_file": .color(named: "primary1"),
            "7": #colorLiteral(red: 0.3293760121, green: 0.329436779, blue: 0.3293679655, alpha: 1),
            "func_decl": .color(named: "secondary2"),
            "8": #colorLiteral(red: 0.3293760121, green: 0.329436779, blue: 0.3293679655, alpha: 1)
        ]
        let rootNode = ShapeNode(node: rootNode, settings: settings, colorDictionary: colorDictionary, delegate: self)
        addChild(rootNode)
        shapeNode(rootNode, didAdd: rootNode)
    }

    // MARK: - Private -

    private var settingsItemObservations: [NSKeyValueObservation] = []

    private func applyRandomForceToAllCastedChildren() {
        for shapeNode in castedChildren {
            if shapeNode.castedParent == nil {
                continue
            }
            let force = CGVector(dx: CGFloat.random(in: -(shapeNode.radius^^3)...shapeNode.radius^^3), dy: CGFloat.random(in: -(shapeNode.radius^^3)...shapeNode.radius^^3))
            shapeNode.physicsBody?.applyImpulse(force)
        }
    }

}

extension NodeScene: ShapeNodeDelegate {

    // MARK: - Internal -

    func shapeNode(_ shapeNode: ShapeNode, didAdd child: ShapeNode) {
        castedChildren.insert(child)
        ([child.node] + child.node.allDescendants).forEach { shapeNodeForNodeDictionary[$0] = child }
        for to in child.resultingArcs {
            let arcToRemove = Arc(from: shapeNode.node, to: to.key)
            arcNodeForArcDictionary.removeValue(forKey: arcToRemove)?.removeFromParent()
            guard shapeNodeForNodeDictionary[to.key] != child else {
                continue
            }
            let arcToAdd = Arc(from: child.node, to: to.key)
            let arcNode = createArcNode(withStrength: to.value)
            addChild(arcNode)
            arcNodeForArcDictionary[arcToAdd] = arcNode
        }
    }

    func shapeNode(_ shapeNode: ShapeNode, didRemove child: ShapeNode) {
        castedChildren.remove(child)
        // the following line only works, when all children of a shapenode are always removed at once...
        shapeNode.node.allDescendants.forEach { shapeNodeForNodeDictionary[$0] = shapeNode }
        for to in child.resultingArcs {
            let arcToRemove = Arc(from: child.node, to: to.key)
            arcNodeForArcDictionary.removeValue(forKey: arcToRemove)?.removeFromParent()
            // ... but if the upper line wouldn't be as it is, the second condition here would fail, if more than one children are removed at once
            guard shapeNode.resultingArcs.keys.contains(to.key) && shapeNodeForNodeDictionary[to.key] != shapeNode else {
                continue
            }
            let arcToAdd = Arc(from: shapeNode.node, to: to.key)
            let arcNode = createArcNode(withStrength: shapeNode.resultingArcs[to.key, default: 0])
            addChild(arcNode)
            arcNodeForArcDictionary[arcToAdd] = arcNode
        }
    }

    // MARK: - Private -

    private func createArcNode(withStrength strength: Int) -> SKShapeNode {
        let arcNode = SKShapeNode()
        arcNode.strokeColor = .windowFrameColor
        arcNode.lineWidth = 8*min(10, max(1, log(CGFloat(strength))))
        arcNode.zPosition = -1
        return arcNode
    }

}