//
//  MailRule.swift
//  PaperlessAPI
//
//  Created by Leo Wehrfritz on 14.12.24.
//

import Foundation

struct MailRule: Codable {
    let id: Int
    let name: String
    let account: Int
    let folder: String
    let filterFrom: String?
    let filterTo: String?
    let filterSubject: String?
    let filterBody: String?
    let filterAttachmentFilenameInclude: String?
    let filterAttachmentFilenameExclude: String?
    let maximumAge: Int
    let action: MailRuleAction
    let actionParameter: String?
    let assignTitleFrom: MailRuleTitleSource
    let assignTags: [Int]
    let assignCorrespondentFrom: MailRuleCorrespondentSource
    let assignCorrespondent: Int?
    let assignDocumentType: Int?
    let assignOwnerFromRule: Bool
    let order: Int
    let attachmentType: MailRuleAttachmentType
    let consumptionScope: MailRuleConsumptionScope
    let owner: Int
    let userCanChange: Bool
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case account
        case folder
        case filterFrom = "filter_from"
        case filterTo = "filter_to"
        case filterSubject = "filter_subject"
        case filterBody = "filter_body"
        case filterAttachmentFilenameInclude = "filter_attachment_filename_include"
        case filterAttachmentFilenameExclude = "filter_attachment_filename_exclude"
        case maximumAge = "maximum_age"
        case action
        case actionParameter = "action_parameter"
        case assignTitleFrom = "assign_title_from"
        case assignTags = "assign_tags"
        case assignCorrespondentFrom = "assign_correspondent_from"
        case assignCorrespondent = "assign_correspondent"
        case assignDocumentType = "assign_document_type"
        case assignOwnerFromRule = "assign_owner_from_rule"
        case order
        case attachmentType = "attachment_type"
        case consumptionScope = "consumption_scope"
        case owner
        case userCanChange = "user_can_change"
    }
}
