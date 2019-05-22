//  Copyright © 2019 Stephan Lerner. All rights reserved.

import SpriteKit

class NodeScene: SKScene {

    private var forceDecay: CGFloat = 1
    private let forceDecayTarget: CGFloat = 0
    private let forceDecayMin: CGFloat = 0.1
    private let forceDecayDecay: CGFloat = 0.005
    private let velocityDecay: CGFloat = 0.9

    private weak var rootNode: ShapeNode?
    private var scopeColorDictionary: [String: NSColor] = [:]

    override init() {
        super.init(size: CGSize.zero)
        delegate = self
        backgroundColor = SKColor.windowBackgroundColor
        setUpPhysicsWorld()
        setUpCamera()
    }

    func setUpPhysicsWorld() {
        physicsWorld.gravity = CGVector.zero
    }

    func add(rootNode: ShapeNode) {
        addChild(rootNode)
        #warning("refactor")
//        rootNode.allCastedDescendants.forEach {
//            makeMoveableByMouse($0)
//        }
        self.rootNode = rootNode
    }

    func setColors(_ dictionary: [String: NSColor]) {
        self.scopeColorDictionary = dictionary
        #warning("refactor")
//        rootNode?.allCastedDescendants.forEach { $0.setColors(dictionary) }
    }

    func startSimulation() {
        isPaused = false
        forceDecay = 1
    }

    func stopSimulation() {
        isPaused = true
        forceDecay = 0
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension NodeScene: SKSceneDelegate {

    func update(_ currentTime: TimeInterval, for scene: SKScene) {
        forceDecay += (forceDecayTarget - forceDecay) * forceDecayDecay
        if forceDecay < forceDecayMin {
            stopSimulation()
            return
        }
        #warning("refactor")
//        rootNode?.updatePhysicsWith(forceDecay: forceDecay, velocityDecay: velocityDecay)
    }

    func didApplyConstraints(for scene: SKScene) {
//        rootNode?.updateAppearance()
    }

}
