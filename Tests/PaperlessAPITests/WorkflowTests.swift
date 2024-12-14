//
//  WorkflowTests.swift
//  PaperlessAPI
//
//  Created by Leo Wehrfritz on 14.12.24.
//

import Testing
import Foundation
@testable import PaperlessAPI

@Test func decodeWorkflow() async throws {
    
    let json = """
{
  "id": 2,
  "name": "Workflow",
  "order": 5,
  "enabled": false,
  "triggers": [
    {
      "id": 2,
      "sources": [
        1,
        2
      ],
      "type": 1,
      "filter_path": "filter path",
      "filter_filename": "filter filename",
      "filter_mailrule": 3,
      "matching_algorithm": 0,
      "match": "",
      "is_insensitive": true,
      "filter_has_tags": [],
      "filter_has_correspondent": null,
      "filter_has_document_type": null
    },
    {
      "id": 3,
      "sources": [],
      "type": 2,
      "filter_path": null,
      "filter_filename": "filter filename",
      "filter_mailrule": null,
      "matching_algorithm": 1,
      "match": "",
      "is_insensitive": true,
      "filter_has_tags": [],
      "filter_has_correspondent": null,
      "filter_has_document_type": null
    },
    {
      "id": 4,
      "sources": [],
      "type": 3,
      "filter_path": null,
      "filter_filename": "filter filename",
      "filter_mailrule": null,
      "matching_algorithm": 3,
      "match": "abc",
      "is_insensitive": false,
      "filter_has_tags": [
        34
      ],
      "filter_has_correspondent": 8,
      "filter_has_document_type": 6
    }
  ],
  "actions": [
    {
      "id": 2,
      "type": 1,
      "assign_title": "assign title",
      "assign_tags": [],
      "assign_correspondent": null,
      "assign_document_type": null,
      "assign_storage_path": null,
      "assign_owner": null,
      "assign_view_users": [],
      "assign_view_groups": [],
      "assign_change_users": [],
      "assign_change_groups": [],
      "assign_custom_fields": [],
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
    },
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
    },
    {
      "id": 4,
      "type": 2,
      "assign_title": null,
      "assign_tags": [],
      "assign_correspondent": null,
      "assign_document_type": null,
      "assign_storage_path": null,
      "assign_owner": null,
      "assign_view_users": [],
      "assign_view_groups": [],
      "assign_change_users": [],
      "assign_change_groups": [],
      "assign_custom_fields": [],
      "remove_all_tags": true,
      "remove_tags": [],
      "remove_all_correspondents": true,
      "remove_correspondents": [],
      "remove_all_document_types": true,
      "remove_document_types": [],
      "remove_all_storage_paths": true,
      "remove_storage_paths": [],
      "remove_custom_fields": [],
      "remove_all_custom_fields": true,
      "remove_all_owners": true,
      "remove_owners": [],
      "remove_all_permissions": true,
      "remove_view_users": [],
      "remove_view_groups": [],
      "remove_change_users": [],
      "remove_change_groups": []
    },
    {
      "id": 5,
      "type": 2,
      "assign_title": null,
      "assign_tags": [],
      "assign_correspondent": null,
      "assign_document_type": null,
      "assign_storage_path": null,
      "assign_owner": null,
      "assign_view_users": [],
      "assign_view_groups": [],
      "assign_change_users": [],
      "assign_change_groups": [],
      "assign_custom_fields": [],
      "remove_all_tags": false,
      "remove_tags": [
        34
      ],
      "remove_all_correspondents": false,
      "remove_correspondents": [
        8
      ],
      "remove_all_document_types": false,
      "remove_document_types": [
        6
      ],
      "remove_all_storage_paths": false,
      "remove_storage_paths": [
        7
      ],
      "remove_custom_fields": [
        26
      ],
      "remove_all_custom_fields": false,
      "remove_all_owners": false,
      "remove_owners": [
        2
      ],
      "remove_all_permissions": false,
      "remove_view_users": [
        2
      ],
      "remove_view_groups": [
        2
      ],
      "remove_change_users": [
        2
      ],
      "remove_change_groups": [
        2
      ]
    }
  ]
}
""".data(using: .utf8)!
    
    
    let decoder = JSONDecoder()
    let workflow = try decoder.decode(Workflow.self, from: json)
    
    #expect(workflow.id == 2)
    #expect(workflow.name == "Workflow")
    #expect(workflow.order == 5)
    #expect(!workflow.enabled)
    #expect(workflow.triggers.count == 3)
    #expect(workflow.actions.count == 4)
}
