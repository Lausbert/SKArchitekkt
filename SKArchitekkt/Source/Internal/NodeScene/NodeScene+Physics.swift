
    #warning("move to scene")
//    func updatePhysicsWith(forceDecay: CGFloat, velocityDecay: CGFloat) {
//        guard !isHidden else { return }
//        castedChildren.forEach { $0.updatePhysicsWith(forceDecay: forceDecay, velocityDecay: velocityDecay) }
//        updateRadialGravitationalForceOnChildrenWith(forceDecay: forceDecay)
//        updateNegativeRadialGravitationalForceOnSiblingsWith(forceDecay: forceDecay)
//        updateSpringForceBetweenByArcConnectedNodes(forceDecay: forceDecay)
//        physicsBody?.velocity *= velocityDecay
//    }
//
//    func updateAppearance() {
//        guard !isHidden else { return }
//        castedChildren.forEach { $0.updateAppearance() }
//        updateArcNodesAppearance()
//    }

    // MARK: - Private -

//    private static let arcNodeDictionaryObjectAssociation = ObjectAssociation<[ShapeNode: SKShapeNode]>()
//    private var arcNodeDictionary: [ShapeNode: SKShapeNode] {
//        get { return ShapeNode.arcNodeDictionaryObjectAssociation[self] ?? [:] }
//        set { ShapeNode.arcNodeDictionaryObjectAssociation[self] = newValue }
//    }

//    private func updateRadialGravitationalForceOnChildrenWith(forceDecay: CGFloat) {
//        guard !isCollapsed else { return }
//        castedChildren.forEach {
//            let force = computeForceBetween(first: self, second: $0, minimumRadius: radius, multiplier: forceDecay*radius^^2*$0.radius^^2, proportionalToDistanceRaisedToPowerOf: -1.6)
//            $0.physicsBody?.applyForce(force)
//        }
//    }
//
//    private func updateNegativeRadialGravitationalForceOnSiblingsWith(forceDecay: CGFloat) {
//        guard !isCollapsed, castedChildren.count > 1 else { return }
//        for pair in siblingPairs {
//            let force = computeForceBetween(first: pair.0, second: pair.1, multiplier: forceDecay*pair.0.radius^^2*pair.1.radius^^2, proportionalToDistanceRaisedToPowerOf: -1.3)
//            pair.0.physicsBody?.applyForce(force)
//            pair.1.physicsBody?.applyForce(-force)
//        }
//    }
//
//
//    private func updateSpringForceBetweenByArcConnectedNodes(forceDecay: CGFloat) {
//        for arc in resultingArcs {
//            var nodes = [self]
//            while let parent = nodes.last?.castedParent, !arc.allCastedAncestors.contains(parent) {
//                nodes.append(parent)
//            }
//            var arcs = [arc]
//            while let parent = arcs.last?.castedParent, !allCastedAncestors.contains(parent) {
//                arcs.append(parent)
//            }
//            guard let lastNode = nodes.last, let lastArc = arcs.last else { return }
//            let offSetDistance = -(lastNode.radius + lastArc.radius)
//            let force = computeForceBetween(first: self, second: arc, offSetDistance: offSetDistance, multiplier: forceDecay, proportionalToDistanceRaisedToPowerOf: 1.8)
//            nodes.forEach {
//                $0.physicsBody?.applyForce(-force)
//            }
//            arcs.forEach {
//                $0.physicsBody?.applyForce(force)
//            }
//        }
//    }
//
//    private func computeForceBetween(first: ShapeNode, second: ShapeNode, offSetDistance: CGFloat = 0, minimumRadius: CGFloat = 0, multiplier: CGFloat = 1, proportionalToDistanceRaisedToPowerOf power: CGFloat = 1) -> CGVector {
//        guard let scene = scene else { return CGVector.zero }
//        let distanceVector = first.convert(CGPoint.zero, to: scene) - second.convert(CGPoint.zero, to: scene)
//        let distance = distanceVector.length() + offSetDistance
//        let newDistance = max(distance, minimumRadius)
//        let normalizedDistanceVector = distance > 0 ? distanceVector/distance : CGVector.zero // important note: normalizedDistanceVector is not really normalized in case of distance <= 0
//        let force = 100*multiplier*newDistance^^power*normalizedDistanceVector
//        return force
//    }
//
//    private func updateArcNodesAppearance() {
//        arcNodeDictionary.forEach { $1.isHidden = true }
//        resultingArcs.forEach { updateArcNodeAppearance(to: $0) }
//    }
//
//    private func updateArcNodeAppearance(to: ShapeNode) {
//        guard let arcNode = arcNodeDictionary[to] else {
//            let arcNode = SKShapeNode()
//            arcNode.strokeColor = .windowFrameColor
//            arcNode.lineWidth = 2
//            arcNode.zPosition = -1
//            scene?.addChild(arcNode)
//            arcNodeDictionary[to] = arcNode
//            return
//        }
//        guard let scene = scene else {
//            return
//        }
//        arcNode.isHidden = false
//        let fromPositionCenter = self.convert(CGPoint.zero, to: scene)
//        let toPositionCenter = to.convert(CGPoint.zero, to: scene)
//        let distanceVector = fromPositionCenter - toPositionCenter
//        let distance = distanceVector.length()
//        let fromPosition = fromPositionCenter - self.radius/distance*distanceVector
//        let toPosition = toPositionCenter + to.radius/distance*distanceVector
//        let path = CGMutablePath()
//        path.move(to: fromPosition)
//        path.addLine(to: toPosition)
//        arcNode.path = path
//    }

