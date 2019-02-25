//  Copyright © 2019 Stephan Lerner. All rights reserved.

import Foundation

protocol Ressource {

    static func identifier() -> String
    static var jsonString: String { get }

}

extension Ressource {

    static func identifier() -> String {
        return String(describing: self)
    }

}
