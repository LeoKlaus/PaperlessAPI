//
//  DocumentType.swift
//  PaperlessAPI
//
//  Created by Leo Wehrfritz on 12.12.24.
//

import Foundation

public struct DocumentType: ListableObject, ModifiableObject {
    
    public static func singularEndpoint(_ id: Int) -> ApiEndpoint {
        .documentType(id)
    }
    
    public static var pluralEndpoint: ApiEndpoint = .documentTypes
    
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
        case setPermissions = "set_permissions"
    }
    
    init(id: Int, name: String, match: String, matchingAlgorithm: MatchingAlgorithm, isInsensitive: Bool, documentCount: Int?, owner: Int?, permissions: ObjectPermissions?) {
        self.id = id
        self.slug = ""
        self.name = name
        self.match = match
        self.matchingAlgorithm = matchingAlgorithm
        self.isInsensitive = isInsensitive
        self.documentCount = documentCount
        self.owner = owner
        self.userCanChange = nil
        self.permissions = permissions
    }
    
    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(Int.self, forKey: .id)
        slug = try container.decode(String.self, forKey: .slug)
        name = try container.decode(String.self, forKey: .name)
        match = try container.decode(String.self, forKey: .match)
        matchingAlgorithm = try container.decode(MatchingAlgorithm.self, forKey: .matchingAlgorithm)
        isInsensitive = try container.decode(Bool.self, forKey: .isInsensitive)
        documentCount = try container.decodeIfPresent(Int.self, forKey: .documentCount)
        owner = try container.decodeIfPresent(Int.self, forKey: .owner)
        userCanChange = try container.decodeIfPresent(Bool.self, forKey: .userCanChange)
        permissions = try container.decodeIfPresent(ObjectPermissions.self, forKey: .permissions)
    }
    
    public func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
        try container.encode(match, forKey: .match)
        try container.encode(matchingAlgorithm, forKey: .matchingAlgorithm)
        try container.encode(isInsensitive, forKey: .isInsensitive)
        try container.encode(owner, forKey: .owner)
        if let permissions {
            try container.encode(permissions, forKey: .setPermissions)
        }
    }
}
