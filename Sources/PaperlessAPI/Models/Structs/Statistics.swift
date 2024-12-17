//
//  Statistics.swift
//  PaperlessAPI
//
//  Created by Leo Wehrfritz on 14.12.24.
//

public struct Statistics: Codable {
    public let documentsTotal: Int
    public let documentsInbox: Int
    public let inboxTag: Int
    public let inboxTags: [Int]
    public let documentFileTypeCounts: [DocumentFileTypeCounts]
    public let characterCount: Int
    public let tagCount: Int
    public let correspondentCount: Int
    public let documentTypeCount: Int
    public let storagePathCount: Int
    public let currentAsn: Int
    
    enum CodingKeys: String, CodingKey {
        case documentsTotal = "documents_total"
        case documentsInbox = "documents_inbox"
        case inboxTag = "inbox_tag"
        case inboxTags = "inbox_tags"
        case documentFileTypeCounts = "document_file_type_counts"
        case characterCount = "character_count"
        case tagCount = "tag_count"
        case correspondentCount = "correspondent_count"
        case documentTypeCount = "document_type_count"
        case storagePathCount = "storage_path_count"
        case currentAsn = "current_asn"
    }
}
