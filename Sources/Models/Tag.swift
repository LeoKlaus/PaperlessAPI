//
//  Tag.swift
//  PaperlessAPI
//
//  Created by Leo Wehrfritz on 13.12.24.
//

import Foundation

struct Tag: Codable {
    let id: Int
    let slug: String
    let name: String
    let color: String
    let textColor: String
    let match: String
    let matchingAlgorithm: MatchingAlgorithm
    let isInsensitive: Bool
    let isInboxTag: Bool
    let documentCount: Int?
    let owner: Int?
    let userCanChange: Bool?
    
    enum CodingKeys: String, CodingKey {
        case id
        case slug
        case name
        case color
        case textColor = "text_color"
        case match
        case matchingAlgorithm = "matching_algorithm"
        case isInsensitive = "is_insensitive"
        case isInboxTag = "is_inbox_tag"
        case documentCount = "document_count"
        case owner
        case userCanChange = "user_can_change"
    }
}
