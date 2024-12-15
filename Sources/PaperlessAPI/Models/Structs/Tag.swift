//
//  Tag.swift
//  PaperlessAPI
//
//  Created by Leo Wehrfritz on 13.12.24.
//

import Foundation
import SwiftUI

public struct PaperlessTag: ListableObject {
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
}
