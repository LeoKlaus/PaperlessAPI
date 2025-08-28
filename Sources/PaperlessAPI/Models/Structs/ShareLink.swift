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
    
    enum EncodingKeys: String, CodingKey {
        case expiration
        case document
        case fileVersion = "file_version"
    }
    
    public init(id: Int = 0, created: Date = .now, expiration: Date?, slug: String = "", document: Int, fileVersion: ShareLinkFileVersion) {
        self.id = id
        self.created = created
        self.expiration = expiration
        self.slug = slug
        self.document = document
        self.fileVersion = fileVersion
    }
    
    public func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: EncodingKeys.self)
        try container.encode(self.expiration, forKey: .expiration)
        try container.encode(self.document, forKey: .document)
        try container.encode(self.fileVersion, forKey: .fileVersion)
    }
}
