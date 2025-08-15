//
//  DocumentFileTypeCounts.swift
//  PaperlessAPI
//
//  Created by Leo Wehrfritz on 14.12.24.
//

import UniformTypeIdentifiers

public struct DocumentFileTypeCounts: Codable, Equatable, Sendable {
    public let mimeType: UTType?
    public let mimeTypeDescription: String
    public let mimeTypeCount: Int
    
    enum CodingKeys: String, CodingKey {
        case mimeType = "mime_type"
        case mimeTypeCount = "mime_type_count"
    }
    
    public init(mimeType: String, mimeTypeCount: Int) {
        self.mimeTypeDescription = mimeType
        self.mimeTypeCount = mimeTypeCount
        self.mimeType = UTType(mimeType: mimeType)
    }
    
    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.mimeTypeDescription = try container.decode(String.self, forKey: .mimeType)
        self.mimeType = UTType(mimeType: self.mimeTypeDescription)
        self.mimeTypeCount = try container.decode(Int.self, forKey: .mimeTypeCount)
    }
}
