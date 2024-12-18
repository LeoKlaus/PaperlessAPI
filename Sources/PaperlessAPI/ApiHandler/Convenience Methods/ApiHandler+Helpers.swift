//
//  ApiHandler+GetDocuments.swift
//  PaperlessAPI
//
//  Created by Leo Wehrfritz on 15.12.24.
//

import Foundation

public extension ApiHandler {
    func getCorrespondents(limit: Int = 25, page: Int = 1, fullPermissions: Bool = false, headers: [String:String] = [:], parameters: [String:String] = [:]) async throws -> [Correspondent] {
        return try await self.getObjects(endpoint: .correspondents, limit: limit, page: page, fullPermissions: fullPermissions, headers: headers,parameters: parameters)
    }
    
    func getDocumentTypes(limit: Int = 25, page: Int = 1, fullPermissions: Bool = false, headers: [String:String] = [:], parameters: [String:String] = [:]) async throws -> [DocumentType] {
        return try await self.getObjects(endpoint: .documentTypes, limit: limit, page: page,fullPermissions: fullPermissions, headers: headers, parameters: parameters)
    }
    
    func getDocuments(limit: Int = 25, page: Int = 1, fullPermissions: Bool = false, headers: [String:String] = [:], parameters: [String:String] = [:]) async throws -> [Document] {
        return try await self.getObjects(endpoint: .documents, limit: limit, page: page, fullPermissions: fullPermissions, headers: headers, parameters: parameters)
    }
    
    func getMailLogs(headers: [String:String] = [:], parameters: [String:String] = [:]) async throws -> [String] {
        return try await self.sendRequest(method: .get, endpoint: .logs(.mail), headers: headers, parameters: parameters)
    }
    
    func getPaperlessLogs(headers: [String:String] = [:], parameters: [String:String] = [:]) async throws -> [String] {
        return try await self.sendRequest(method: .get, endpoint: .logs(.paperless), headers: headers, parameters: parameters)
    }
    
    func getTags(limit: Int = 25, page: Int = 1, fullPermissions: Bool = false, headers: [String:String] = [:], parameters: [String:String] = [:]) async throws -> [PaperlessTag] {
        return try await self.getObjects(endpoint: .tags, limit: limit, page: page, fullPermissions: fullPermissions, headers: headers, parameters: parameters)
    }
    
    func getSavedViews(limit: Int = 25, page: Int = 1, fullPermissions: Bool = false, headers: [String:String] = [:], parameters: [String:String] = [:]) async throws -> [SavedView] {
        return try await self.getObjects(endpoint: .savedViews, limit: limit, page: page, fullPermissions: fullPermissions, headers: headers, parameters: parameters)
    }
    
    func getStoragePaths(limit: Int = 25, page: Int = 1, fullPermissions: Bool = false, headers: [String:String] = [:], parameters: [String:String] = [:]) async throws -> [StoragePath] {
        return try await self.getObjects(endpoint: .storagePaths, limit: limit, page: page, fullPermissions: fullPermissions, headers: headers, parameters: parameters)
    }
    
    func getTasks(headers: [String:String] = [:], parameters: [String:String] = [:]) async throws -> [PaperlessTask] {
        return try await self.sendRequest(method: .get, endpoint: .tasks, headers: headers, parameters: parameters)
    }
    
    func getUsers(limit: Int = 25, page: Int = 1, fullPermissions: Bool = false, headers: [String:String] = [:], parameters: [String:String] = [:]) async throws -> [User] {
        return try await self.getObjects(endpoint: .users, limit: limit, page: page, fullPermissions: fullPermissions, headers: headers, parameters: parameters)
    }
    
    func getGroups(limit: Int = 25, page: Int = 1, fullPermissions: Bool = false, headers: [String:String] = [:], parameters: [String:String] = [:]) async throws -> [PaperlessGroup] {
        return try await self.getObjects(endpoint: .groups, limit: limit, page: page, fullPermissions: fullPermissions, headers: headers, parameters: parameters)
    }
    
    func getMailAccounts(limit: Int = 25, page: Int = 1, fullPermissions: Bool = false, headers: [String:String] = [:], parameters: [String:String] = [:]) async throws -> [MailAccount] {
        return try await self.getObjects(endpoint: .mailAccounts, limit: limit, page: page, fullPermissions: fullPermissions, headers: headers, parameters: parameters)
    }
    
    func getMailRules(limit: Int = 25, page: Int = 1, fullPermissions: Bool = false, headers: [String:String] = [:], parameters: [String:String] = [:]) async throws -> [MailRule] {
        return try await self.getObjects(endpoint: .mailRules, limit: limit, page: page, fullPermissions: fullPermissions, headers: headers, parameters: parameters)
    }
    
    func getShareLinks(limit: Int = 25, page: Int = 1, fullPermissions: Bool = false, headers: [String:String] = [:], parameters: [String:String] = [:]) async throws -> [ShareLink] {
        return try await self.getObjects(endpoint: .shareLinks, limit: limit, page: page, fullPermissions: fullPermissions, headers: headers, parameters: parameters)
    }
    
    func getWorkflowTriggers(limit: Int = 25, page: Int = 1, fullPermissions: Bool = false, headers: [String:String] = [:], parameters: [String:String] = [:]) async throws -> [WorkflowTrigger] {
        return try await self.getObjects(endpoint: .workflowTriggers, limit: limit, page: page, fullPermissions: fullPermissions, headers: headers, parameters: parameters)
    }
    
    func getWorkflowActions(limit: Int = 25, page: Int = 1, fullPermissions: Bool = false, headers: [String:String] = [:], parameters: [String:String] = [:]) async throws -> [WorkflowAction] {
        return try await self.getObjects(endpoint: .workflowActions, limit: limit, page: page, fullPermissions: fullPermissions, headers: headers, parameters: parameters)
    }
    
    func getWorkflows(limit: Int = 25, page: Int = 1, fullPermissions: Bool = false, headers: [String:String] = [:], parameters: [String:String] = [:]) async throws -> [Workflow] {
        return try await self.getObjects(endpoint: .workflows, limit: limit, page: page, fullPermissions: fullPermissions, headers: headers, parameters: parameters)
    }
    
    func getCustomFields(limit: Int = 25, page: Int = 1, fullPermissions: Bool = false, headers: [String:String] = [:], parameters: [String:String] = [:]) async throws -> [CustomField] {
        return try await self.getObjects(endpoint: .customFields, limit: limit, page: page, fullPermissions: fullPermissions, headers: headers, parameters: parameters)
    }
    
    func getConfig(headers: [String:String] = [:], parameters: [String:String] = [:]) async throws -> [Config] {
        return try await self.sendRequest(method: .get, endpoint: .config, headers: headers, parameters: parameters)
    }
    
    func getProfile(headers: [String:String] = [:], parameters: [String:String] = [:]) async throws -> Profile {
        return try await self.sendRequest(method: .get, endpoint: .profile, headers: headers, parameters: parameters)
    }
}
