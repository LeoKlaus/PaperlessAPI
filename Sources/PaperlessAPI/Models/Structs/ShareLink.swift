//
//  ShareLink.swift
//  PaperlessAPI
//
//  Created by Leo Wehrfritz on 14.12.24.
//

import Foundation

public struct ShareLink: PaperlessObject {
    public let id: Int
    let created: Date
    let expiration: Date?
    let slug: String
    let document: Int
    let fileVersion: ShareLinkFileVersion
    
    enum CodingKeys: String, CodingKey {
        case id
        case created
        case expiration
        case slug
        case document
        case fileVersion = "file_version"
    }
}
