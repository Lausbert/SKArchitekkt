// Copyright © 2020 Stephan Lerner. All rights reserved.

import Foundation

enum SettingsValue: Codable {
   
    case range(value: Double, minValue: Double, maxValue: Double)
    
    enum CodingKeys: CodingKey {
        case range
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let key = container.allKeys.first
        
        switch key {
        case .range:
            let (value, minValue, maxValue): (Double, Double, Double) = try container.decodeValues(for: .range)
            self = .range(value: value, minValue: minValue, maxValue: maxValue)
        case .none:
            throw DecodingError.dataCorrupted(
                DecodingError.Context(
                    codingPath: container.codingPath,
                    debugDescription: "Unabled to decode enum."
                )
            )
        }
    }
       
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        switch self {
        case let .range(value, minValue, maxValue):
            try container.encodeValues(value, minValue, maxValue, for: .range)
        }
    }
}
