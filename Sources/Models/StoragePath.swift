//
//  StoragePath.swift
//  PaperlessAPI
//
//  Created by Leo Wehrfritz on 13.12.24.
//

import Foundation

struct StoragePath {
    let id: Int
    let slug: String
    let name: String
    let path: String
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
        case path
        case match
        case matchingAlgorithm = "matching_algorithm"
        case isInsensitive = "is_insensitive"
        case documentCount = "document_count"
        case owner
    }
}
