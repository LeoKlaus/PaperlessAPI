//
//  Statistics.swift
//  PaperlessAPI
//
//  Created by Leo Wehrfritz on 14.12.24.
//

public struct Statistics: Codable, Sendable {
    public let documentsTotal: Int
    public let documentsInbox: Int?
    public let inboxTag: Int?
    public let inboxTags: [Int]?
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
    
    public init(documentsTotal: Int, documentsInbox: Int, inboxTag: Int, inboxTags: [Int], documentFileTypeCounts: [DocumentFileTypeCounts], characterCount: Int, tagCount: Int, correspondentCount: Int, documentTypeCount: Int, storagePathCount: Int, currentAsn: Int) {
        self.documentsTotal = documentsTotal
        self.documentsInbox = documentsInbox
        self.inboxTag = inboxTag
        self.inboxTags = inboxTags
        self.documentFileTypeCounts = documentFileTypeCounts
        self.characterCount = characterCount
        self.tagCount = tagCount
        self.correspondentCount = correspondentCount
        self.documentTypeCount = documentTypeCount
        self.storagePathCount = storagePathCount
        self.currentAsn = currentAsn
    }
}
