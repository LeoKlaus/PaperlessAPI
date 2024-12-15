//
//  ApiEndpoint.swift
//  PaperlessAPI
//
//  Created by Leo Wehrfritz on 13.12.24.
//

import Foundation

public enum ApiEndpoint: RawRepresentable {
    // Authorization
    case token
    // General usage
    case correspondents
    case correspondent(Int)
    case documentTypes
    case documentType(Int)
    case documents
    case document(Int)
    case postDocument
    case bulkEditDocuments
    case bulkDownloadDocuments // POST a list of document ids to download them as zip
    case selectionData // POST a list of document ids to see infos about their attributes
    case logs(LogType)
    case tags
    case tag(Int)
    case savedViews
    case savedView(Int)
    case storagePaths
    case storagePath(Int)
    case tasks
    case task(Int)
    case users
    case user(Int)
    case groups
    case group(Int)
    case mailAccounts
    case mailAccount(Int)
    case mailRules
    case mailRule(Int)
    case shareLinks
    case shareLink(Int)
    case workflowTriggers
    case workflowTrigger(Int)
    case workflowActions
    case workflowAction(Int)
    case workflows
    case workflow(Int)
    case customFields
    case customField(Int)
    case config
    case search
    case autoComplete
    case bulkEditObjects
    // These are not listed in the api page
    case remoteVersion
    case statistics
    case uiSettings
    case profile
    case generateAuthToken
    case disconnectSocialAccount
    case socialAccountProviders
    case totp
    case status
    case trash
    
    case custom(String)
    
    public typealias RawValue = String
    public init?(rawValue: String) {
        switch rawValue {
        case "/api/token/": self = .token
        case "/api/correspondents/": self = .correspondents
        case "/api/document_types/": self = .documentTypes
        case "/api/documents/": self = .documents
        case "/api/documents/post_document/": self = .postDocument
        case "/api/documents/bulk_edit/": self = .bulkEditDocuments
        case "/api/documents/bulk_download/": self = .bulkDownloadDocuments
        case "/api/documents/selection_data/": self = .selectionData
        case "/api/logs/mail/": self = .logs(.mail)
        case "/api/logs/paperless/": self = .logs(.paperless)
        case "/api/tags/": self = .tags
        case "/api/saved_views/": self = .savedViews
        case "/api/storage_paths/": self = .storagePaths
        case "/api/tasks/": self = .tasks
        case "/api/users/": self = .users
        case "/api/groups/": self = .groups
        case "/api/mail_accounts/": self = .mailAccounts
        case "/api/mail_rules/": self = .mailRules
        case "/api/share_links/": self = .shareLinks
        case "/api/workflow_triggers/": self = .workflowTriggers
        case "/api/workflow_actions/": self = .workflowActions
        case "/api/workflows/": self = .workflows
        case "/api/custom_fields/": self = .customFields
        case "/api/config/": self = .config
        case "/api/search/": self = .search
        case "/api/autocomplete/": self = .autoComplete
        case "/api/bulk_edit_objects/": self = .bulkEditObjects
        case "/api/remote_version/": self = .remoteVersion
        case "/api/statistics/": self = .statistics
        case "/api/ui_settings/": self = .uiSettings
        case "/api/profile/": self = .profile
        case "/api/profile/generate_auth_token/": self = .generateAuthToken
        case "/api/profile/disconnect_social_account/": self = .disconnectSocialAccount
        case "/api/profile/social_account_providers/": self = .socialAccountProviders
        case "/api/profile/totp/": self = .totp
        case "/api/status/": self = .status
        case "/api/trash/": self = .trash
        default: self = .custom(rawValue)
        }
    }
    
    public var rawValue: String {
        switch self {
        case .token: return "/api/token/"
        case .correspondents: return "/api/correspondents/"
        case .correspondent(let id): return "/api/correspondents/\(id)/"
        case .documentTypes: return "/api/document_types/"
        case .documentType(let id): return "/api/document_types/\(id)/"
        case .documents: return "/api/documents/"
        case .document(let id): return "/api/documents/\(id)/"
        case .postDocument: return "/api/documents/post_document/"
        case .bulkEditDocuments: return "/api/documents/bulk_edit/"
        case .bulkDownloadDocuments: return "/api/documents/bulk_download/"
        case .selectionData: return "/api/documents/selection_data/"
        case .logs(let type): return "/api/logs/\(type)/"
        case .tags: return "/api/tags/"
        case .tag(let id): return "/api/tags/\(id)/"
        case .bulkEditObjects: return "/api/bulk_edit_objects/"
        case .savedViews: return "/api/saved_views/"
        case .savedView(let id): return "/api/saved_views/\(id)/"
        case .storagePaths: return "/api/storage_paths/"
        case .storagePath(let id): return "/api/storage_paths/\(id)/"
        case .tasks: return "/api/tasks/"
        case .task(let id): return "/api/tasks/\(id)/"
        case .users: return "/api/users/"
        case .user(let id): return "/api/users/\(id)/"
        case .groups: return "/api/groups/"
        case .group(let id): return "/api/groups/\(id)/"
        case .mailAccounts: return "/api/mail_accounts/"
        case .mailAccount(let id): return "/api/mail_accounts/\(id)/"
        case .mailRules: return "/api/mail_rules/"
        case .mailRule(let id): return "/api/mail_rules/\(id)/"
        case .shareLinks: return "/api/share_links/"
        case .shareLink(let id): return "/api/share_links/\(id)/"
        case .workflowTriggers: return "/api/workflow_triggers/"
        case .workflowTrigger(let id): return "/api/workflow_triggers/\(id)/"
        case .workflowActions: return "/api/workflow_actions/"
        case .workflowAction(let id): return "/api/workflow_actions/\(id)/"
        case .workflows: return "/api/workflows/"
        case .workflow(let id): return "/api/workflows/\(id)/"
        case .customFields: return "/api/custom_fields/"
        case .customField(let id): return "/api/custom_fields/\(id)/"
        case .config: return "/api/config/"
        case .search: return "/api/search/"
        case .autoComplete: return "/api/autocomplete/"
        case .remoteVersion: return "/api/remote_version/"
        case .statistics: return "/api/statistics/"
        case .uiSettings: return "/api/ui_settings/"
        case .profile: return "/api/profile/"
        case .generateAuthToken: return "/api/profile/generate_auth_token/"
        case .disconnectSocialAccount: return "/api/profile/disconnect_social_account/"
        case .socialAccountProviders: return "/api/profile/social_account_providers/"
        case .totp: return "/api/profile/totp/"
        case .status: return "/api/status/"
        case .trash: return "/api/trash/"
        case .custom(let rawValue): return rawValue
        }
    }
}

public enum LogType: RawRepresentable, Codable {
    case mail, paperless
    case unknown(String)
    
    public typealias RawValue = String
    public init(rawValue: String) {
        switch rawValue {
        case "mail": self = .mail
        case "paperless": self = .paperless
        default: self = .unknown(rawValue)
        }
    }
    
    public var rawValue: String {
        switch self {
        case .mail: return "mail"
        case .paperless: return "paperless"
        case .unknown(let rawValue): return rawValue
        }
    }
}
