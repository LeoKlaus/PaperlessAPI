//
//  DocumentType.swift
//  PaperlessAPI
//
//  Created by Leo Wehrfritz on 12.12.24.
//

import Foundation

public struct DocumentType: ListableObject, ModifiableObject, Hashable, Sendable {
    
    public static func singularEndpoint(_ id: Int) -> ApiEndpoint {
        .documentType(id)
    }
    
    public static var pluralEndpoint: ApiEndpoint = .documentTypes
    
    public var id: Int
    public let slug: String
    public var name: String
    public var match: String
    public var matchingAlgorithm: MatchingAlgorithm
    public var isInsensitive: Bool
    public let documentCount: Int?
    public var owner: Int?
    public let userCanChange: Bool?
    public var permissions: ObjectPermissions?
    
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
    
    public init(id: Int, slug: String, name: String, match: String, matchingAlgorithm: MatchingAlgorithm, isInsensitive: Bool, documentCount: Int?, owner: Int?, permissions: ObjectPermissions?) {
        self.id = id
        self.slug = slug
        self.name = name
        self.match = match
        self.matchingAlgorithm = matchingAlgorithm
        self.isInsensitive = isInsensitive
        self.documentCount = documentCount
        self.owner = owner
        self.userCanChange = nil
        self.permissions = permissions
    }
    
    enum EncodingKeys: String, CodingKey {
        case name
        case match
        case matchingAlgorithm = "matching_algorithm"
        case isInsesitive = "is_insensitive"
        case owner
        case setPermissions = "set_permissions"
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: EncodingKeys.self)
        try container.encode(name, forKey: .name)
        try container.encode(match, forKey: .match)
        try container.encode(matchingAlgorithm, forKey: .matchingAlgorithm)
        try container.encode(isInsensitive, forKey: .isInsesitive)
        try container.encodeIfPresent(owner, forKey: .owner)
        try container.encodeIfPresent(permissions, forKey: .setPermissions)
    }
}
