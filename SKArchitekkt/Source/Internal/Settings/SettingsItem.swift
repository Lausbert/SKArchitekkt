//  Copyright © 2019 Stephan Lerner. All rights reserved.

import Foundation

class SettingsItem: ObservableObject, Codable {

    let name: String
    @Published var value: SettingsValue

    init(name: String, value: SettingsValue) {
        self.name = name
        self.value = value
    }
    
    enum CodingKeys: CodingKey {
        case name, value
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
        self.value = try container.decode(SettingsValue.self, forKey: .value)
    }
       
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
        try container.encode(value, forKey: .value)
    }

}
