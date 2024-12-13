//
//  DocumentType.swift
//  PaperlessAPI
//
//  Created by Leo Wehrfritz on 12.12.24.
//

import Foundation

struct DocumentType: Codable {
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
}
