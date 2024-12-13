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
}
