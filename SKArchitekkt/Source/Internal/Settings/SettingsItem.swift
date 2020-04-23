//  Copyright © 2019 Stephan Lerner. All rights reserved.

import Foundation

class SettingsItem: NSObject, Codable {

    let name: String
    @objc dynamic var value: Double
    var minValue: Double
    var maxValue: Double

    init(name: String, value: Double, minValue: Double, maxValue: Double) {
        self.name = name
        self.value = value
        self.minValue = minValue
        self.maxValue = maxValue
    }

}
