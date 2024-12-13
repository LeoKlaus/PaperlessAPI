//
//  Document.swift
//  PaperlessAPI
//
//  Created by Leo Wehrfritz on 12.12.24.
//

import Foundation

struct Document: Codable {
    let id: Int
    let correspondent: Int?
    let documentType: Int?
    let storagePath: Int?
    let title: String?
    let content: String?
    let tags: [Int]
    let created: Date
    let createdDate: Date
    let modified: Date
    let added: Date
    let deletedAt: Date?
    let archiveSerialNumber: Int?
    let originalFileName: String
    let archivedFileName: String
    let owner: Int?
    let userCanChange: Bool?
    let isSharedByRequester: Bool?
    let notes: [Note]?
    let customFields: [CustomFieldContent]?
    let pageCount: Int?
    
    enum CodingKeys: String, CodingKey {
        case id
        case correspondent
        case documentType = "document_type"
        case storagePath = "storage_path"
        case title
        case content
        case tags
        case created
        case createdDate = "created_date"
        case modified
        case added
        case deletedAt = "deleted_at"
        case archiveSerialNumber = "archive_serial_number"
        case originalFileName = "original_file_name"
        case archivedFileName = "archived_file_name"
        case owner
        case userCanChange = "user_can_change"
        case isSharedByRequester = "is_shared_by_requester"
        case notes
        case customFields = "custom_fields"
        case pageCount = "page_count"
    }
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(Int.self, forKey: .id)
        correspondent = try container.decodeIfPresent(Int.self, forKey: .correspondent)
        documentType = try container.decodeIfPresent(Int.self, forKey: .documentType)
        storagePath = try container.decodeIfPresent(Int.self, forKey: .storagePath)
        title = try container.decodeIfPresent(String.self, forKey: .title)
        content = try container.decodeIfPresent(String.self, forKey: .content)
        tags = try container.decode([Int].self, forKey: .tags)
        created = try container.decode(Date.self, forKey: .created)
        createdDate = try container.decode(Date.self, forKey: .createdDate)
        modified = try container.decode(Date.self, forKey: .modified)
        added = try container.decode(Date.self, forKey: .added)
        deletedAt = try container.decodeIfPresent(Date.self, forKey: .deletedAt)
        archiveSerialNumber = try container.decodeIfPresent(Int.self, forKey: .archiveSerialNumber)
        originalFileName = try container.decode(String.self, forKey: .originalFileName)
        archivedFileName = try container.decode(String.self, forKey: .archivedFileName)
        owner = try container.decodeIfPresent(Int.self, forKey: .owner)
        userCanChange = try container.decodeIfPresent(Bool.self, forKey: .userCanChange)
        isSharedByRequester = try container.decodeIfPresent(Bool.self, forKey: .isSharedByRequester)
        notes = try container.decodeIfPresent([Note].self, forKey: .notes)
        customFields = try container.decodeIfPresent([CustomFieldContent].self, forKey: .customFields)
        pageCount = try container.decodeIfPresent(Int.self, forKey: .pageCount)
    }
}
