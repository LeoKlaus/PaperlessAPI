//
//  Tag.swift
//  PaperlessAPI
//
//  Created by Leo Wehrfritz on 13.12.24.
//

import Foundation
import SwiftUI

public struct PaperlessTag: ListableObject, ModifiableObject, Identifiable, Hashable {
    
    public static func singularEndpoint(_ id: Int) -> ApiEndpoint {
        .tag(id)
    }
    
    public static var pluralEndpoint: ApiEndpoint = .tags
    
    public let id: Int
    public let slug: String
    public let name: String
    public let color: Color
    public let textColor: Color
    public let match: String
    public let matchingAlgorithm: MatchingAlgorithm
    public let isInsensitive: Bool
    public let isInboxTag: Bool
    public let documentCount: Int?
    public let owner: Int?
    public let userCanChange: Bool?
    public let permissions: ObjectPermissions?
    
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
}
