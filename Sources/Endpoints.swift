//
//  File.swift
//  PaperlessAPI
//
//  Created by Leo Wehrfritz on 13.12.24.
//

import Foundation

enum APIEndpoint: RawRepresentable {
    // Authorization
    case token
    // General usage
    case correspondents
    case documentTypes
    case documents
    case postDocument
    case bulkEditDocuments
    case bulkDownloadDocuments // POST a list of document ids to download them as zip
    case selectionData // POST a list of document ids to see infos about their attributes
    case logs
    case tags
    case savedViews
    case storagePaths
    case tasks
    case users
    case groups
    case mailAccounts
    case mailRules
    case shareLinks
    case workflowTriggers
    case workflowActions
    case workflows
    case customFields
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
    
    typealias RawValue = String
    init?(rawValue: String) {
        switch rawValue {
        case "/api/token/": self = .token
        case "/api/correspondents/": self = .correspondents
        case "/api/document_types/": self = .documentTypes
        case "/api/documents/": self = .documents
        case "/api/documents/post_document/": self = .postDocument
        case "/api/documents/bulk_edit/": self = .bulkEditDocuments
        case "/api/documents/bulk_download/": self = .bulkDownloadDocuments
        case "/api/documents/selection_data/": self = .selectionData
        case "/api/logs/": self = .logs
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
    
    var rawValue: String {
        switch self {
        case .token: return "/api/token/"
        case .correspondents: return "/api/correspondents/"
        case .documentTypes: return "/api/document_types/"
        case .documents: return "/api/documents/"
        case .postDocument: return "/api/documents/post_document/"
        case .bulkEditDocuments: return "/api/documents/bulk_edit/"
        case .bulkDownloadDocuments: return "/api/documents/bulk_download/"
        case .selectionData: return "/api/documents/selection_data/"
        case .logs: return "/api/logs/"
        case .tags: return "/api/tags/"
        case .bulkEditObjects: return "/api/bulk_edit_objects/"
        case .savedViews: return "/api/saved_views/"
        case .storagePaths: return "/api/storage_paths/"
        case .tasks: return "/api/tasks/"
        case .users: return "/api/users/"
        case .groups: return "/api/groups/"
        case .mailAccounts: return "/api/mail_accounts/"
        case .mailRules: return "/api/mail_rules/"
        case .shareLinks: return "/api/share_links/"
        case .workflowTriggers: return "/api/workflow_triggers/"
        case .workflowActions: return "/api/workflow_actions/"
        case .workflows: return "/api/workflows/"
        case .customFields: return "/api/custom_fields/"
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
