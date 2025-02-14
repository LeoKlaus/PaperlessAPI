//
//  BulkEditMethod.swift
//  PaperlessAPI
//
//  Created by Leo Wehrfritz on 04.02.25.
//

import Foundation

public enum BulkEditMethod {
    case setCorrespondent(id: Int)
    case setDocumentType(id: Int)
    case setStoragePath(id: Int)
    case addTag(id: Int)
    case removeTag(id: Int)
    case modifyTags(add: [Int] = [], remove: [Int] = [])
    case delete
    case reprocess
    case setPermissions(permissions: ObjectPermissions? = nil, owner: Int? = nil, merge: Bool = false)
    case merge(metadataDocId: Int? = nil, deleteOriginals: Bool = false)
    case split(pages: [String], deleteOriginals: Bool = false)
    case rotate(degrees: Int)
    case deletePages(pages: [Int])
    case modifyCustomFields(addCustomFields: [Int:CustomFieldValue?] = [:], removeCustomFields: [Int] = [])
    
    enum CodingKeys: String, CodingKey {
        case setCorrespondent = "set_correspondent"
        case setDocumentType = "set_document_type"
        case setStoragePath = "set_storage_path"
        case addTag = "add_tag"
        case removeTag = "remove_tag"
        case modifyTags = "modify_tags"
        case delete
        case reprocess
        case setPermissions = "set_permissions"
        case merge
        case split
        case rotate
        case deletePages = "delete_pages"
        case modifyCustomFields = "modify_custom_fields"
    }
    
    public func requestBody(for docIds: [Int]) throws -> Data {
        
        var request: [String:Any] = [
            "documents": docIds
        ]
        
        switch self {
        case .setCorrespondent(let id):
            request["method"] = "set_correspondent"
            request["parameters"] = [
                "correspondent": id
            ]
        case .setDocumentType(let id):
            request["method"] = "set_document_type"
            request["parameters"] = [
                "document_type": id
            ]
        case .setStoragePath(let id):
            request["method"] = "set_storage_path"
            request["parameters"] = [
                "storage_path": id
            ]
        case .addTag(let id):
            request["method"] = "add_tag"
            request["parameters"] = [
                "tag": id
            ]
        case .removeTag(let id):
            request["method"] = "remove_tag"
            request["parameters"] = [
                "tag": id
            ]
        case .modifyTags(let add, let remove):
            request["method"] = "modify_tags"
            request["parameters"] = [
                "add_tags": add,
                "remove_tags": remove
            ]
        case .delete:
            request["method"] = "delete"
        case .reprocess:
            request["method"] = "reprocess"
        case .setPermissions(let permissions, let owner, let merge):
            request["method"] = "set_permissions"
            var parameters: [String:Any] = [:]
            if let permissions {
                parameters["set_permissions"] = [
                    "view": [
                        "users": permissions.view.users,
                        "groups": permissions.view.groups,
                    ],
                    "change": [
                        "users": permissions.change.users,
                        "groups": permissions.change.groups,
                    ],
                ]
            }
            if let owner {
                parameters["owner"] = owner
            }
            parameters["merge"] = merge
            request["parameters"] = parameters
        case .merge(let metadataDocId, let deleteOriginals):
            request["method"] = "merge"
            
            var parameters: [String:Any] = [:]
            
            if let metadataDocId {
                parameters["metadata_document_id"] = metadataDocId
            }
            parameters["delete_originals"] = deleteOriginals
            request["parameters"] = parameters
        case .split(let pages, let deleteOriginals):
            request["method"] = "split"
            request["parameters"] = [
                "pages": pages,
                "delete_originals": deleteOriginals
            ]
        case .rotate(let degrees):
            request["method"] = "rotate"
            request["parameters"] = [
                "degrees": degrees
            ]
        case .deletePages(let pages):
            request["method"] = "delete_pages"
            request["parameters"] = [
                "pages": pages
            ]
        case .modifyCustomFields(let addCustomFields, let removeCustomFields):
            request["method"] = "modify_custom_fields"
            
            var addFields: [String:Any?] = [:]
            
            for (key, value) in addCustomFields {
                addFields[String(key)] = value?.value(forBulkEdit: true)
            }
            
            request["parameters"] = [
                "add_custom_fields": addFields,
                "remove_custom_fields": removeCustomFields
            ]
        }
        
        return try JSONSerialization.data(withJSONObject: request)
    }
}
