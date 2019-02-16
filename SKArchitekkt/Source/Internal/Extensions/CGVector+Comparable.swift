//  Copyright © 2019 Stephan Lerner. All rights reserved.

import Foundation

extension CGVector: Comparable {
    
    public static func < (lhs: CGVector, rhs: CGVector) -> Bool {
        return ((lhs.dx*lhs.dx) + (lhs.dy*lhs.dy)) < ((rhs.dx*rhs.dx) + (rhs.dy*rhs.dy))
    }
    
}
