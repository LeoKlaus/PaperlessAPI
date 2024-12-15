//
//  WorkflowAction.swift
//  PaperlessAPI
//
//  Created by Leo Wehrfritz on 14.12.24.
//

public struct WorkflowAction: PaperlessObject {
    public let id: Int
    let type: WorkflowActionType
    let assignTitle: String?
    let assignTags: [Int]
    let assignCorrespondent: Int?
    let assignDocumentType: Int?
    let assignStoragePath: Int?
    let assignOwner: Int?
    let assignViewUsers: [Int]
    let assignViewGroups: [Int]
    let assignChangeUsers: [Int]
    let assignChangeGroups: [Int]
    let assignCustomFields: [Int]
    let removeAllTags: Bool
    let removeTags: [Int]
    let removeAllCorrespondents: Bool
    let removeCorrespondents: [Int]
    let removeAllDocumentTypes: Bool
    let removeDocumentTypes: [Int]
    let removeAllStoragePaths: Bool
    let removeStoragePaths: [Int]
    let removeCustomFields: [Int]
    let removeAllCustomFields: Bool
    let removeAllOwners: Bool
    let removeOwners: [Int]
    let removeAllPermissions: Bool
    let removeViewUsers: [Int]
    let removeViewGroups: [Int]
    let removeChangeUsers: [Int]
    let removeChangeGroups: [Int]
    
    enum CodingKeys: String, CodingKey {
        case id
        case type
        case assignTitle = "assign_title"
        case assignTags = "assign_tags"
        case assignCorrespondent = "assign_correspondent"
        case assignDocumentType = "assign_document_type"
        case assignStoragePath = "assign_storage_path"
        case assignOwner = "assign_owner"
        case assignViewUsers = "assign_view_users"
        case assignViewGroups = "assign_view_groups"
        case assignChangeUsers = "assign_change_users"
        case assignChangeGroups = "assign_change_groups"
        case assignCustomFields = "assign_custom_fields"
        case removeAllTags = "remove_all_tags"
        case removeTags = "remove_tags"
        case removeAllCorrespondents = "remove_all_correspondents"
        case removeCorrespondents = "remove_correspondents"
        case removeAllDocumentTypes = "remove_all_document_types"
        case removeDocumentTypes = "remove_document_types"
        case removeAllStoragePaths = "remove_all_storage_paths"
        case removeStoragePaths = "remove_storage_paths"
        case removeCustomFields = "remove_custom_fields"
        case removeAllCustomFields = "remove_all_custom_fields"
        case removeAllOwners = "remove_all_owners"
        case removeOwners = "remove_owners"
        case removeAllPermissions = "remove_all_permissions"
        case removeViewUsers = "remove_view_users"
        case removeViewGroups = "remove_view_groups"
        case removeChangeUsers = "remove_change_users"
        case removeChangeGroups = "remove_change_groups"
    }
}
