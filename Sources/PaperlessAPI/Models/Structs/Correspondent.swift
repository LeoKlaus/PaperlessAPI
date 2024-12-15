//
//  Correspondent.swift
//  PaperlessAPI
//
//  Created by Leo Wehrfritz on 12.12.24.
//

import Foundation

public struct Correspondent: PaperlessObject {
    public let id: Int
    public let slug: String
    public let name: String
    public let match: String
    public let matchingAlgorithm: MatchingAlgorithm
    public let isInsensitive: Bool
    public let documentCount: Int?
    public let owner: Int?
    public let userCanChange: Bool?
    public let permissions: ObjectPermissions?
    
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
        case permissions
    }
}
