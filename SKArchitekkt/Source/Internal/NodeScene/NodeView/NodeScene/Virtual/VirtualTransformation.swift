// Copyright © 2020 Stephan Lerner. All rights reserved.

import Foundation

enum VirtualTransformation: Hashable, Codable {
    
    // MARK: - Internal -

    case unfold(id: UUID)
    
    enum CodingKeys: CodingKey {
        case unfold
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let key = container.allKeys.first
        
        switch key {
        case .unfold:
            let uuid = try container.decode(UUID.self, forKey: .unfold)
            self = .unfold(id: uuid)
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
        case let .unfold(id: uuid):
            try container.encode(uuid, forKey: .unfold)
        }
    }
}
