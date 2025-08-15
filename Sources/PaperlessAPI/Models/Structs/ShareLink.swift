//
//  ShareLink.swift
//  PaperlessAPI
//
//  Created by Leo Wehrfritz on 14.12.24.
//

import Foundation

public struct ShareLink: ListableObject, ModifiableObject, Sendable {
    
    public static func singularEndpoint(_ id: Int) -> ApiEndpoint {
        .shareLink(id)
    }
    
    public static let pluralEndpoint: ApiEndpoint = .shareLinks
    
    public let id: Int
    public let created: Date
    public let expiration: Date?
    public let slug: String
    public let document: Int
    public let fileVersion: ShareLinkFileVersion
    
    enum CodingKeys: String, CodingKey {
        case id
        case created
        case expiration
        case slug
        case document
        case fileVersion = "file_version"
    }
}
