//  Copyright © 2019 Stephan Lerner. All rights reserved.

import SpriteKit

class NodeScene: SKScene {
    
    private var forceDecay: CGFloat = 1
    private let forceDecayTarget: CGFloat = 0
    private let forceDecayMin: CGFloat = 0.02
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
        rootNode.allCastedDescendants.forEach {
            makeMoveableByMouse($0)
        }
        self.rootNode = rootNode
    }
    
    func setColors(_ dictionary: [String : NSColor]) {
        self.scopeColorDictionary = dictionary
        rootNode?.allCastedDescendants.forEach { $0.setColors(dictionary) }
    }
    
    func startSimulation() {
        isPaused = false
        forceDecay = 1
        rootNode?.updatePhysicsWith(forceDecay: forceDecay, velocityDecay: velocityDecay)
    }
    
    func stopSimulation() {
        isPaused = true
        forceDecay = 0
        rootNode?.updatePhysicsWith(forceDecay: forceDecay, velocityDecay: velocityDecay)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension NodeScene: SKSceneDelegate {
    
    func update(_ currentTime: TimeInterval, for scene: SKScene) {
        forceDecay += (forceDecayTarget - forceDecay) * forceDecayDecay;
        if forceDecay < forceDecayMin {
            stopSimulation()
            return
        }
        
        rootNode?.updatePhysicsWith(forceDecay: forceDecay, velocityDecay: velocityDecay)
    }
    
    func didApplyConstraints(for scene: SKScene) {
        rootNode?.updateAppearance()
    }
    
}
