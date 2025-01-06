//
//  Document.swift
//  PaperlessAPI
//
//  Created by Leo Wehrfritz on 12.12.24.
//

import Foundation

public struct Document: ListableObject, ModifiableObject, Identifiable, Hashable {
    public static func singularEndpoint(_ id: Int) -> ApiEndpoint {
        .document(id)
    }
    
    public static var pluralEndpoint: ApiEndpoint = .documents
    
    
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
    public let originalFileName: String?
    public let archivedFileName: String?
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
    
    public init(id: Int, correspondent: Int?, documentType: Int?, storagePath: Int?, title: String?, content: String?, tags: [Int], created: Date, createdDate: Date, modified: Date, added: Date, deletedAt: Date?, archiveSerialNumber: Int?, originalFileName: String, archivedFileName: String, owner: Int?, userCanChange: Bool?, isSharedByRequester: Bool?, notes: [Note]?, customFields: [CustomFieldContent]?, pageCount: Int?, permissions: ObjectPermissions?) {
        self.id = id
        self.correspondent = correspondent
        self.documentType = documentType
        self.storagePath = storagePath
        self.title = title
        self.content = content
        self.tags = tags
        self.created = created
        self.createdDate = createdDate
        self.modified = modified
        self.added = added
        self.deletedAt = deletedAt
        self.archiveSerialNumber = archiveSerialNumber
        self.originalFileName = originalFileName
        self.archivedFileName = archivedFileName
        self.owner = owner
        self.userCanChange = userCanChange
        self.isSharedByRequester = isSharedByRequester
        self.notes = notes
        self.customFields = customFields
        self.pageCount = pageCount
        self.permissions = permissions
    }
    
    public func toMultiPartData(boundary: String, fileURL: URL) throws -> Data {
        var body = Data()
        
        if let title {
            body.append("--\(boundary)\r\n")
            body.append("Content-Disposition: form-data; name=\"title\"\r\n\r\n")
            body.append(title)
            body.append("\r\n")
        }
        
        body.append("--\(boundary)\r\n")
        body.append("Content-Disposition: form-data; name=\"created\"\r\n\r\n")
        body.append(created.ISO8601Format())
        body.append("\r\n")
        
        if let correspondent {
            body.append("--\(boundary)\r\n")
            body.append("Content-Disposition: form-data; name=\"correspondent\"\r\n\r\n")
            body.append(String(correspondent))
            body.append("\r\n")
        }
        
        if let documentType {
            body.append("--\(boundary)\r\n")
            body.append("Content-Disposition: form-data; name=\"document_type\"\r\n\r\n")
            body.append(String(documentType))
            body.append("\r\n")
        }
        
        for tag in tags {
            body.append("--\(boundary)\r\n")
            body.append("Content-Disposition: form-data; name=\"tags\"\r\n\r\n")
            body.append(String(tag))
            body.append("\r\n")
        }
        
        if let archiveSerialNumber {
            body.append("--\(boundary)\r\n")
            body.append("Content-Disposition: form-data; name=\"archive_serial_number\"\r\n\r\n")
            body.append(String(archiveSerialNumber))
            body.append("\r\n")
        }
        
        let filename = fileURL.lastPathComponent
        let data = try Data(contentsOf: fileURL)
        body.append("--\(boundary)\r\n")
        body.append("Content-Disposition: form-data; name=\"document\"; filename=\"\(filename)\"\r\n")
        body.append("Content-Type: \(fileURL.mimeType)\r\n\r\n")
        body.append(data)
        body.append("\r\n")
        
        body.append("--\(boundary)--\r\n")
        return body
    }
}
