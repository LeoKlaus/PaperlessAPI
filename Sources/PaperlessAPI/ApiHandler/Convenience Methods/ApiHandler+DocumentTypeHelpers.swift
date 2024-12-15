//
//  ApiHandler+DocumentTypeHelpers.swift
//  PaperlessAPI
//
//  Created by Leo Wehrfritz on 15.12.24.
//



import Foundation

extension ApiHandler {
    public func getDocumentTypes(limit: Int = 25, page: Int = 1, fullPermissions: Bool = false, parameters: [String:String] = [:]) async throws -> [DocumentType] {
        return try await self.getObjects(endpoint: .documentTypes, limit: limit, page: page, fullPermissions: fullPermissions, parameters: parameters)
    }
    
    public func getDocumentType(id: Int) async throws -> DocumentType {
        return try await self.sendRequest(method: .get, endpoint: .correspondent(id))
    }
    
    public func createDocumentType(_ documentType: DocumentType) async throws -> DocumentType {
        let JSONEncoder = JSONEncoder()
        let body = try JSONEncoder.encode(documentType)
        return try await self.sendRequest(method: .post, endpoint: .documentTypes, body: body)
    }
    
    public func updateDocumentType(_ documentType: DocumentType) async throws -> DocumentType {
        let JSONEncoder = JSONEncoder()
        let body = try JSONEncoder.encode(documentType)
        return try await self.sendRequest(method: .patch, endpoint: .documentType(documentType.id), body: body)
    }
    
    public func deleteDocumentType(_ documentType: DocumentType) async throws {
        return try await self.sendRequest(method: .delete, endpoint: .documentType(documentType.id))
    }
    
    public func deleteDocumentType(id: Int) async throws {
        return try await self.sendRequest(method: .delete, endpoint: .documentType(id))
    }
}
