//
//  Correspondent.swift
//  PaperlessAPI
//
//  Created by Leo Wehrfritz on 12.12.24.
//

import Foundation

struct Correspondent: Codable {
    let id: Int
    let slug: String
    let name: String
    let match: String
    let matchingAlgorithm: Int
    let isInsensitive: Bool
    let documentCount: Int?
    let owner: Int?
    let userCanChange: Bool?
    
    enum CodingKeys: String, CodingKey {
        case id
        case slug
        case name
        case match
        case matchingAlgorithm = "matching_algorithm"
        case isInsensitive = "is_insensitive"
        case documentCount = "document_count"
        case owner
        case userCanChange = "user_can_change"
    }
    
    func decode(from decoder: Decoder) throws -> Correspondent {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        return try Correspondent(
            id: container.decode(Int.self, forKey: .id),
            slug: container.decode(String.self, forKey: .slug),
            name: container.decode(String.self, forKey: .name),
            match: container.decode(String.self, forKey: .match),
            matchingAlgorithm: container.decode(Int.self, forKey: .matchingAlgorithm),
            isInsensitive: container.decode(Bool.self, forKey: .isInsensitive),
            documentCount: container.decodeIfPresent(Int.self, forKey: .documentCount),
            owner: container.decodeIfPresent(Int.self, forKey: .owner),
            userCanChange: container.decodeIfPresent(Bool.self, forKey: .userCanChange)
        )
    }
    
    func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(id, forKey: .id)
        try container.encode(slug, forKey: .slug)
        try container.encode(name, forKey: .name)
        try container.encode(match, forKey: .match)
        try container.encode(matchingAlgorithm, forKey: .matchingAlgorithm)
        try container.encode(isInsensitive, forKey: .isInsensitive)
        try container.encodeIfPresent(documentCount, forKey: .documentCount)
        try container.encodeIfPresent(owner, forKey: .owner)
    }
}
