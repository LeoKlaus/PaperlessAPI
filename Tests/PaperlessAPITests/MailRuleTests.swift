//
//  MailRuleTests.swift
//  PaperlessAPI
//
//  Created by Leo Wehrfritz on 14.12.24.
//

import Testing
import Foundation
@testable import PaperlessAPI

@Test func decodeMailRule() async throws {
    
    let json = """
{
      "id": 3,
      "name": "MarkRead",
      "account": 1,
      "folder": "INBOX",
      "filter_from": null,
      "filter_to": null,
      "filter_subject": null,
      "filter_body": null,
      "filter_attachment_filename_include": null,
      "filter_attachment_filename_exclude": null,
      "maximum_age": 21,
      "action": 3,
      "action_parameter": null,
      "assign_title_from": 2,
      "assign_tags": [],
      "assign_correspondent_from": 4,
      "assign_correspondent": 4,
      "assign_document_type": 7,
      "assign_owner_from_rule": true,
      "order": 3,
      "attachment_type": 2,
      "consumption_scope": 2,
      "owner": 3,
      "user_can_change": true
}
""".data(using: .utf8)!
    
    
    let decoder = JSONDecoder()
    let mailRule = try decoder.decode(MailRule.self, from: json)
    
    #expect(mailRule.id == 3)
    #expect(mailRule.name == "MarkRead")
    #expect(mailRule.account == 1)
    #expect(mailRule.folder == "INBOX")
    #expect(mailRule.filterFrom == nil)
    #expect(mailRule.filterTo == nil)
    #expect(mailRule.filterSubject == nil)
    #expect(mailRule.filterBody == nil)
    #expect(mailRule.filterAttachmentFilenameInclude == nil)
    #expect(mailRule.filterAttachmentFilenameExclude == nil)
    #expect(mailRule.maximumAge == 21)
    #expect(mailRule.action == .markAsRead)
    #expect(mailRule.actionParameter == nil)
    #expect(mailRule.assignTitleFrom == .attachment)
    #expect(mailRule.assignTags == [])
    #expect(mailRule.assignCorrespondentFrom == .selected)
    #expect(mailRule.assignCorrespondent == 4)
    #expect(mailRule.assignDocumentType == 7)
    #expect(mailRule.assignOwnerFromRule)
    #expect(mailRule.order == 3)
    #expect(mailRule.attachmentType == .allFiles)
    #expect(mailRule.consumptionScope == .message)
    #expect(mailRule.owner == 3)
    #expect(mailRule.userCanChange ?? false)
}

@Test func decodeMailRuleWithPermissions() async throws {
    
    let json = """
{
      "id": 1,
      "name": "Move and delete",
      "account": 1,
      "folder": "INBOX",
      "filter_from": null,
      "filter_to": null,
      "filter_subject": null,
      "filter_body": null,
      "filter_attachment_filename_include": null,
      "filter_attachment_filename_exclude": null,
      "maximum_age": 7,
      "action": 1,
      "action_parameter": null,
      "assign_title_from": 1,
      "assign_tags": [],
      "assign_correspondent_from": 1,
      "assign_correspondent": null,
      "assign_document_type": null,
      "assign_owner_from_rule": true,
      "order": 1,
      "attachment_type": 1,
      "consumption_scope": 1,
      "owner": 3,
      "permissions": {
        "view": {
          "users": [],
          "groups": []
        },
        "change": {
          "users": [],
          "groups": []
        }
      }
}
""".data(using: .utf8)!
    
    
    let decoder = JSONDecoder()
    let mailRule = try decoder.decode(MailRule.self, from: json)
    
    #expect(mailRule.id == 1)
    #expect(mailRule.name == "Move and delete")
    #expect(mailRule.account == 1)
    #expect(mailRule.folder == "INBOX")
    #expect(mailRule.filterFrom == nil)
    #expect(mailRule.filterTo == nil)
    #expect(mailRule.filterSubject == nil)
    #expect(mailRule.filterBody == nil)
    #expect(mailRule.filterAttachmentFilenameInclude == nil)
    #expect(mailRule.filterAttachmentFilenameExclude == nil)
    #expect(mailRule.maximumAge == 7)
    #expect(mailRule.action == .delete)
    #expect(mailRule.actionParameter == nil)
    #expect(mailRule.assignTitleFrom == .subject)
    #expect(mailRule.assignTags == [])
    #expect(mailRule.assignCorrespondentFrom == .doNotAssign)
    #expect(mailRule.assignCorrespondent == nil)
    #expect(mailRule.assignDocumentType == nil)
    #expect(mailRule.assignOwnerFromRule)
    #expect(mailRule.order == 1)
    #expect(mailRule.attachmentType == .attachments)
    #expect(mailRule.consumptionScope == .attachments)
    #expect(mailRule.owner == 3)
    #expect(mailRule.permissions?.view.users == [])
    #expect(mailRule.permissions?.view.groups == [])
    #expect(mailRule.permissions?.change.users == [])
    #expect(mailRule.permissions?.change.groups == [])
}
