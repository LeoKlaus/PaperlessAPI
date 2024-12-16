//
//  MailRule.swift
//  PaperlessAPI
//
//  Created by Leo Wehrfritz on 14.12.24.
//

import Foundation

public struct MailRule: ListableObject, ModifiableObject {
    public static func singularEndpoint(_ id: Int) -> ApiEndpoint {
        .mailRule(id)
    }
    
    public static var pluralEndpoint: ApiEndpoint = .mailRules
    
    
    public let id: Int
    public let name: String
    public let account: Int
    public let folder: String
    public let filterFrom: String?
    public let filterTo: String?
    public let filterSubject: String?
    public let filterBody: String?
    public let filterAttachmentFilenameInclude: String?
    public let filterAttachmentFilenameExclude: String?
    public let maximumAge: Int
    public let action: MailRuleAction
    public let actionParameter: String?
    public let assignTitleFrom: MailRuleTitleSource
    public let assignTags: [Int]
    public let assignCorrespondentFrom: MailRuleCorrespondentSource
    public let assignCorrespondent: Int?
    public let assignDocumentType: Int?
    public let assignOwnerFromRule: Bool
    public let order: Int
    public let attachmentType: MailRuleAttachmentType
    public let consumptionScope: MailRuleConsumptionScope
    public let owner: Int
    public let userCanChange: Bool?
    public let permissions: ObjectPermissions?
    
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
        case permissions
    }
}
