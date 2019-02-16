//  Copyright © 2019 Stephan Lerner. All rights reserved.

import Foundation

extension CGPoint {
    
    static func + (left: CGPoint, right: CGPoint) -> CGVector {
        return CGVector(dx: left.x + right.x, dy: left.y + right.y)
    }
    
    static func + (left: CGPoint, right: CGVector) -> CGPoint {
        return CGPoint(x: left.x + right.dx, y: left.y + right.dy)
    }
    
    static func - (left: CGPoint, right: CGPoint) -> CGVector {
        return CGVector(dx: left.x - right.x, dy: left.y - right.y)
    }
    
    static func - (left: CGPoint, right: CGVector) -> CGPoint {
        return CGPoint(x: left.x - right.dx, y: left.y - right.dy)
    }
    
}
