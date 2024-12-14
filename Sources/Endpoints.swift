//
//  File.swift
//  PaperlessAPI
//
//  Created by Leo Wehrfritz on 13.12.24.
//

import Foundation

enum APIEndpoint: String {
    case correspondents = "/api/correspondents/"
    case documentTypes = "/api/document_types/"
    case documents = "/api/documents/"
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
    // These are not listed in the api page
    case remoteVersion = "/api/remote_version/"
}
