//
//  WorkflowActionTests.swift
//  PaperlessAPI
//
//  Created by Leo Wehrfritz on 14.12.24.
//

import Testing
import Foundation
@testable import PaperlessAPI

@Test func decodeWorkflowAction() async throws {
    
    let json = """
{
  "id": 3,
  "type": 1,
  "assign_title": null,
  "assign_tags": [
    34
  ],
  "assign_correspondent": 8,
  "assign_document_type": 6,
  "assign_storage_path": 7,
  "assign_owner": 2,
  "assign_view_users": [
    2
  ],
  "assign_view_groups": [
    2
  ],
  "assign_change_users": [
    2
  ],
  "assign_change_groups": [
    2
  ],
  "assign_custom_fields": [
    24
  ],
  "remove_all_tags": false,
  "remove_tags": [],
  "remove_all_correspondents": false,
  "remove_correspondents": [],
  "remove_all_document_types": false,
  "remove_document_types": [],
  "remove_all_storage_paths": false,
  "remove_storage_paths": [],
  "remove_custom_fields": [],
  "remove_all_custom_fields": false,
  "remove_all_owners": false,
  "remove_owners": [],
  "remove_all_permissions": false,
  "remove_view_users": [],
  "remove_view_groups": [],
  "remove_change_users": [],
  "remove_change_groups": []
}
""".data(using: .utf8)!
    
    
    let decoder = JSONDecoder()
    let workflowAction = try decoder.decode(WorkflowAction.self, from: json)
    
    #expect(workflowAction.id == 3)
    #expect(workflowAction.type == .assignment)
    #expect(workflowAction.assignTitle == nil)
    #expect(workflowAction.assignTags == [34])
    #expect(workflowAction.assignCorrespondent == 8)
    #expect(workflowAction.assignDocumentType == 6)
    #expect(workflowAction.assignStoragePath == 7)
    #expect(workflowAction.assignOwner == 2)
    #expect(workflowAction.assignViewUsers == [2])
    #expect(workflowAction.assignViewGroups == [2])
    #expect(workflowAction.assignChangeUsers == [2])
    #expect(workflowAction.assignChangeGroups == [2])
    #expect(workflowAction.assignCustomFields == [24])
    #expect(workflowAction.removeAllTags == false)
    #expect(workflowAction.removeTags == [])
    #expect(workflowAction.removeAllCorrespondents == false)
    #expect(workflowAction.removeCorrespondents == [])
    #expect(workflowAction.removeAllDocumentTypes == false)
    #expect(workflowAction.removeDocumentTypes == [])
    #expect(workflowAction.removeAllStoragePaths == false)
    #expect(workflowAction.removeStoragePaths == [])
    #expect(workflowAction.removeCustomFields == [])
    #expect(workflowAction.removeAllCustomFields == false)
    #expect(workflowAction.removeAllOwners == false)
    #expect(workflowAction.removeOwners == [])
    #expect(workflowAction.removeAllPermissions == false)
    #expect(workflowAction.removeViewUsers == [])
    #expect(workflowAction.removeViewGroups == [])
    #expect(workflowAction.removeChangeUsers == [])
    #expect(workflowAction.removeChangeGroups == [])
}
