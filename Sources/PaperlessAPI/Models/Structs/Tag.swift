//
//  Tag.swift
//  PaperlessAPI
//
//  Created by Leo Wehrfritz on 13.12.24.
//

import Foundation
import SwiftUI

public struct PaperlessTag: ListableObject, ModifiableObject, Identifiable, Hashable, Sendable {
    
    public static func singularEndpoint(_ id: Int) -> ApiEndpoint {
        .tag(id)
    }
    
    public static let pluralEndpoint: ApiEndpoint = .tags
    
    public var id: Int
    public let slug: String
    public var name: String
    public var color: Color
    public var textColor: Color
    public var match: String
    public var matchingAlgorithm: MatchingAlgorithm
    public var isInsensitive: Bool
    public var isInboxTag: Bool
    public let documentCount: Int?
    public var owner: Int?
    public let userCanChange: Bool?
    public var permissions: ObjectPermissions?
    
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
        case permissions
    }
    
    public init(id: Int, slug: String, name: String, color: Color, textColor: Color, match: String, matchingAlgorithm: MatchingAlgorithm, isInsensitive: Bool, isInboxTag: Bool, documentCount: Int?, owner: Int?, userCanChange: Bool?, permissions: ObjectPermissions?) {
        self.id = id
        self.slug = slug
        self.name = name
        self.color = color
        self.textColor = textColor
        self.match = match
        self.matchingAlgorithm = matchingAlgorithm
        self.isInsensitive = isInsensitive
        self.isInboxTag = isInboxTag
        self.documentCount = documentCount
        self.owner = owner
        self.userCanChange = userCanChange
        self.permissions = permissions
    }
    
    enum EncodingKeys: String, CodingKey {
        case name
        case color
        case match
        case matchingAlgorithm = "matching_algorithm"
        case isInsesitive = "is_insensitive"
        case isInboxTag = "is_inbox_tag"
        case owner
        case setPermissions = "set_permissions"
    }
    
    public func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: EncodingKeys.self)
        try container.encode(name, forKey: .name)
        try container.encode(color.toHex(), forKey: .color)
        try container.encode(match, forKey: .match)
        try container.encode(matchingAlgorithm.rawValue, forKey: .matchingAlgorithm)
        try container.encode(isInsensitive, forKey: .isInsesitive)
        try container.encode(isInboxTag, forKey: .isInboxTag)
        try container.encodeIfPresent(owner, forKey: .owner)
        try container.encodeIfPresent(permissions, forKey: .setPermissions)
    }
}
