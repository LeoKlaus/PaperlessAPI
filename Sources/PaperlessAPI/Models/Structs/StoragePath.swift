//
//  StoragePath.swift
//  PaperlessAPI
//
//  Created by Leo Wehrfritz on 13.12.24.
//

import Foundation

public struct StoragePath: ListableObject, ModifiableObject, Hashable {
    
    public static func singularEndpoint(_ id: Int) -> ApiEndpoint {
        .storagePath(id)
    }
    
    public static var pluralEndpoint: ApiEndpoint = .storagePaths
    
    public let id: Int
    public let slug: String
    public let name: String
    public let path: String
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
        case path
        case match
        case matchingAlgorithm = "matching_algorithm"
        case isInsensitive = "is_insensitive"
        case documentCount = "document_count"
        case owner
        case userCanChange = "user_can_change"
        case permissions
    }
    
    public init(id: Int, slug: String, name: String, path: String, match: String, matchingAlgorithm: MatchingAlgorithm, isInsensitive: Bool, documentCount: Int?, owner: Int?, permissions: ObjectPermissions?) {
        self.id = id
        self.slug = slug
        self.name = name
        self.path = path
        self.match = match
        self.matchingAlgorithm = matchingAlgorithm
        self.isInsensitive = isInsensitive
        self.documentCount = documentCount
        self.owner = owner
        self.userCanChange = nil
        self.permissions = permissions
    }
}
