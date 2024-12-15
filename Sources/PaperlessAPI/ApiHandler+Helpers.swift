//
//  ApiHandler+GetDocuments.swift
//  PaperlessAPI
//
//  Created by Leo Wehrfritz on 15.12.24.
//

extension ApiHandler {
    public func getCorrespondents(limit: Int = 25, page: Int = 1, fullPermissions: Bool = false, parameters: [String:String] = [:]) async throws -> [Correspondent] {
        return try await self.getObjects(endpoint: .correspondents, limit: limit, page: page, fullPermissions: fullPermissions, parameters: parameters)
    }
    
    public func getDocumentTypes(limit: Int = 25, page: Int = 1, fullPermissions: Bool = false, parameters: [String:String] = [:]) async throws -> [DocumentType] {
        return try await self.getObjects(endpoint: .documentTypes, limit: limit, page: page, fullPermissions: fullPermissions, parameters: parameters)
    }
    
    public func getDocuments(limit: Int = 25, page: Int = 1, fullPermissions: Bool = false, parameters: [String:String] = [:]) async throws -> [Document] {
        return try await self.getObjects(endpoint: .documents, limit: limit, page: page, fullPermissions: fullPermissions, parameters: parameters)
    }
    
    public func getMailLogs(parameters: [String:String] = [:]) async throws -> [String] {
        return try await self.sendRequest(method: .get, endpoint: .mailLogs, parameters: parameters)
    }
    
    public func getPaperlessLogs(parameters: [String:String] = [:]) async throws -> [String] {
        return try await self.sendRequest(method: .get, endpoint: .paperlessLogs, parameters: parameters)
    }
    
    public func getTags(limit: Int = 25, page: Int = 1, fullPermissions: Bool = false, parameters: [String:String] = [:]) async throws -> [PaperlessTag] {
        return try await self.getObjects(endpoint: .tags, limit: limit, page: page, fullPermissions: fullPermissions, parameters: parameters)
    }
    
    public func getSavedViews(limit: Int = 25, page: Int = 1, fullPermissions: Bool = false, parameters: [String:String] = [:]) async throws -> [SavedView] {
        return try await self.getObjects(endpoint: .savedViews, limit: limit, page: page, fullPermissions: fullPermissions, parameters: parameters)
    }
    
    public func getStoragePaths(limit: Int = 25, page: Int = 1, fullPermissions: Bool = false, parameters: [String:String] = [:]) async throws -> [StoragePath] {
        return try await self.getObjects(endpoint: .storagePaths, limit: limit, page: page, fullPermissions: fullPermissions, parameters: parameters)
    }
    
    public func getTasks(parameters: [String:String] = [:]) async throws -> [PaperlessTask] {
        return try await self.sendRequest(method: .get, endpoint: .tasks, parameters: parameters)
    }
    
    public func getUsers(limit: Int = 25, page: Int = 1, fullPermissions: Bool = false, parameters: [String:String] = [:]) async throws -> [User] {
        return try await self.getObjects(endpoint: .users, limit: limit, page: page, fullPermissions: fullPermissions, parameters: parameters)
    }
    
    public func getGroups(limit: Int = 25, page: Int = 1, fullPermissions: Bool = false, parameters: [String:String] = [:]) async throws -> [PaperlessGroup] {
        return try await self.getObjects(endpoint: .groups, limit: limit, page: page, fullPermissions: fullPermissions, parameters: parameters)
    }
    
    public func getMailAccounts(limit: Int = 25, page: Int = 1, fullPermissions: Bool = false, parameters: [String:String] = [:]) async throws -> [MailAccount] {
        return try await self.getObjects(endpoint: .mailAccounts, limit: limit, page: page, fullPermissions: fullPermissions, parameters: parameters)
    }
    
    public func getMailRules(limit: Int = 25, page: Int = 1, fullPermissions: Bool = false, parameters: [String:String] = [:]) async throws -> [MailRule] {
        return try await self.getObjects(endpoint: .mailRules, limit: limit, page: page, fullPermissions: fullPermissions, parameters: parameters)
    }
    
    public func getShareLinks(limit: Int = 25, page: Int = 1, fullPermissions: Bool = false, parameters: [String:String] = [:]) async throws -> [ShareLink] {
        return try await self.getObjects(endpoint: .shareLinks, limit: limit, page: page, fullPermissions: fullPermissions, parameters: parameters)
    }
    
    public func getWorkflowTriggers(limit: Int = 25, page: Int = 1, fullPermissions: Bool = false, parameters: [String:String] = [:]) async throws -> [WorkflowTrigger] {
        return try await self.getObjects(endpoint: .workflowTriggers, limit: limit, page: page, fullPermissions: fullPermissions, parameters: parameters)
    }
    
    public func getWorkflowActions(limit: Int = 25, page: Int = 1, fullPermissions: Bool = false, parameters: [String:String] = [:]) async throws -> [WorkflowAction] {
        return try await self.getObjects(endpoint: .workflowActions, limit: limit, page: page, fullPermissions: fullPermissions, parameters: parameters)
    }
    
    public func getWorkflows(limit: Int = 25, page: Int = 1, fullPermissions: Bool = false, parameters: [String:String] = [:]) async throws -> [Workflow] {
        return try await self.getObjects(endpoint: .workflows, limit: limit, page: page, fullPermissions: fullPermissions, parameters: parameters)
    }
    
    public func getCustomFields(limit: Int = 25, page: Int = 1, fullPermissions: Bool = false, parameters: [String:String] = [:]) async throws -> [CustomField] {
        return try await self.getObjects(endpoint: .customFields, limit: limit, page: page, fullPermissions: fullPermissions, parameters: parameters)
    }
    
    public func getConfig(parameters: [String:String] = [:]) async throws -> [Config] {
        return try await self.sendRequest(method: .get, endpoint: .config, parameters: parameters)
    }
}
