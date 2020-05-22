// Copyright © 2020 Stephan Lerner. All rights reserved.

import Foundation

enum VirtualTransformation: Hashable, Codable {
    
    // MARK: - Internal -

    case unfoldNode(id: UUID)
    case unfoldScope(scope: String)
    
    enum CodingKeys: CodingKey {
        case unfoldNode
        case unfoldScope
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let key = container.allKeys.first
        
        switch key {
        case .unfoldNode:
            let uuid = try container.decode(UUID.self, forKey: .unfoldNode)
            self = .unfoldNode(id: uuid)
        case .unfoldScope:
            let scope = try container.decode(String.self, forKey: .unfoldScope)
            self = .unfoldScope(scope: scope)
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
        case let .unfoldNode(id: uuid):
            try container.encode(uuid, forKey: .unfoldNode)
        case let .unfoldScope(scope: scope):
            try container.encode(scope, forKey: .unfoldScope)
        }
    }
}
