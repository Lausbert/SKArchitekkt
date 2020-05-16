//  Copyright © 2019 Stephan Lerner. All rights reserved.

import Foundation

class SettingsItem: Codable {
    
    // MARK: - Internal -

    let name: String
    @Published var value: SettingsValue
    let initialValue: SettingsValue?

    init(name: String, value: SettingsValue, initialValue: SettingsValue? = nil) {
        self.name = name
        self.value = value
        self.initialValue = initialValue
    }
    
    enum CodingKeys: CodingKey {
        case name, value, initialValue
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
        self.value = try container.decode(SettingsValue.self, forKey: .value)
        self.initialValue = try container.decode(SettingsValue?.self, forKey: .initialValue)
    }
       
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
        try container.encode(value, forKey: .value)
        try container.encode(initialValue, forKey: .initialValue)
    }

}
