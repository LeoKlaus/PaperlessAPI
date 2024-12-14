//
//  File.swift
//  PaperlessAPI
//
//  Created by Leo Wehrfritz on 13.12.24.
//

import Foundation

enum APIEndpoint: String {
    // Authorization
    case token = "/api/token/"
    // General usage
    case correspondents = "/api/correspondents/"
    case documentTypes = "/api/document_types/"
    case documents = "/api/documents/"
    case postDocument = "/api/documents/post_document/"
    case bulkEditDocuments = "/api/documents/bulk_edit/"
    case bulkDownloadDocuments = "/api/documents/bulk_download/" // POST a list of document ids to download them as zip
    case selectionData = "/api/documents/selection_data/" // POST a list of document ids to see infos about their attributes
    case logs = "/api/logs/"
    case tags = "/api/tags/"
    case savedViews = "/api/saved_views/"
    case storagePaths = "/api/storage_paths/"
    case tasks = "/api/tasks/"
    case users = "/api/users/"
    case groups = "/api/groups/"
    case mailAccounts = "/api/mail_accounts/"
    case mailRules = "/api/mail_rules/"
    case shareLinks = "/api/share_links/"
    case workflowTriggers = "/api/workflow_triggers/"
    case workflowActions = "/api/workflow_actions/"
    case workflows = "/api/workflows/"
    case customFields = "/api/custom_fields/"
    case config = "/api/config/"
    case search = "/api/search/"
    case autoComplete = "/api/autocomplete/"
    case bulkEditObjects = "/api/bulk_edit_objects/"
    // These are not listed in the api page
    case remoteVersion = "/api/remote_version/"
    case statistics = "/api/statistics/"
    case uiSettings = "/api/ui_settings/"
    case profile = "/api/profile/"
    case generateAuthToken = "/api/profile/generate_auth_token/"
    case disconnectSocialAccount = "/api/profile/disconnect_social_account/"
    case socialAccountProviders = "/api/profile/social_account_providers/"
    case totp = "/api/profile/totp/"
    case status = "/api/status/"
}
