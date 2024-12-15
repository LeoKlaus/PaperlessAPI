//
//  Document.swift
//  PaperlessAPI
//
//  Created by Leo Wehrfritz on 12.12.24.
//

import Foundation

public struct Document: ListableObject {
    public let id: Int
    public let correspondent: Int?
    public let documentType: Int?
    public let storagePath: Int?
    public let title: String?
    public let content: String?
    public let tags: [Int]
    public let created: Date
    public let createdDate: Date
    public let modified: Date
    public let added: Date
    public let deletedAt: Date?
    public let archiveSerialNumber: Int?
    public let originalFileName: String
    public let archivedFileName: String
    public let owner: Int?
    public let userCanChange: Bool?
    public let isSharedByRequester: Bool?
    public let notes: [Note]?
    public let customFields: [CustomFieldContent]?
    public let pageCount: Int?
    public let permissions: ObjectPermissions?
    
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
        case permissions
    }
}
