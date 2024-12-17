//
//  WorkflowAction.swift
//  PaperlessAPI
//
//  Created by Leo Wehrfritz on 14.12.24.
//

public struct WorkflowAction: ListableObject, ModifiableObject {
    
    public static func singularEndpoint(_ id: Int) -> ApiEndpoint {
        .workflowAction(id)
    }
    
    public static var pluralEndpoint: ApiEndpoint = .workflowActions
    
    public let id: Int
    public let type: WorkflowActionType
    public let assignTitle: String?
    public let assignTags: [Int]
    public let assignCorrespondent: Int?
    public let assignDocumentType: Int?
    public let assignStoragePath: Int?
    public let assignOwner: Int?
    public let assignViewUsers: [Int]
    public let assignViewGroups: [Int]
    public let assignChangeUsers: [Int]
    public let assignChangeGroups: [Int]
    public let assignCustomFields: [Int]
    public let removeAllTags: Bool
    public let removeTags: [Int]
    public let removeAllCorrespondents: Bool
    public let removeCorrespondents: [Int]
    public let removeAllDocumentTypes: Bool
    public let removeDocumentTypes: [Int]
    public let removeAllStoragePaths: Bool
    public let removeStoragePaths: [Int]
    public let removeCustomFields: [Int]
    public let removeAllCustomFields: Bool
    public let removeAllOwners: Bool
    public let removeOwners: [Int]
    public let removeAllPermissions: Bool
    public let removeViewUsers: [Int]
    public let removeViewGroups: [Int]
    public let removeChangeUsers: [Int]
    public let removeChangeGroups: [Int]
    
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
