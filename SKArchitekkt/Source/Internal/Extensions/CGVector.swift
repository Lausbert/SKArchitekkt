//  Copyright © 2019 Stephan Lerner. All rights reserved.

import Foundation

extension CGVector {
    
    static func + (left: CGVector, right: CGVector) -> CGVector {
        return CGVector(dx: left.dx + right.dx, dy: left.dy + right.dy)
    }
    
    static func - (left: CGVector, right: CGVector) -> CGVector {
        return CGVector(dx: left.dx - right.dx, dy: left.dy - right.dy)
    }
    
    static func * (left: CGFloat, right: CGVector) -> CGVector {
        return CGVector(dx: left*right.dx, dy: left*right.dy)
    }
    
    static func / (vector: CGVector, scalar: CGFloat) -> CGVector {
        return CGVector(dx: vector.dx / scalar, dy: vector.dy / scalar)
    }
    
    static func *= (left: inout CGVector, right: CGFloat) {
        left = CGVector(dx: right * left.dx, dy: right * left.dy)
    }
    
    static prefix func - (vector: CGVector) -> CGVector {
        return CGVector(dx: -vector.dx, dy: -vector.dy)
    }
    
    public func length() -> CGFloat {
        return sqrt(dx*dx + dy*dy)
    }
    
}
