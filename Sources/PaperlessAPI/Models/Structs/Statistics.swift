//
//  Statistics.swift
//  PaperlessAPI
//
//  Created by Leo Wehrfritz on 14.12.24.
//

public struct Statistics: Codable {
    let documentsTotal: Int
    let documentsInbox: Int
    let inboxTag: Int
    let inboxTags: [Int]
    let documentFileTypeCounts: [DocumentFileTypeCounts]
    let characterCount: Int
    let tagCount: Int
    let correspondentCount: Int
    let documentTypeCount: Int
    let storagePathCount: Int
    let currentAsn: Int
    
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
