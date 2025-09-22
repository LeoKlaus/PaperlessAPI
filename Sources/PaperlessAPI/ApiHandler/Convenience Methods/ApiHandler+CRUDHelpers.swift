//
//  ApiHandler+CRUDHelpers.swift
//  PaperlessAPI
//
//  Created by Leo Wehrfritz on 16.12.24.
//

import Foundation
import UniformTypeIdentifiers

public extension ApiHandler {
    
    func uploadDocument(_ document: Document, fileURL: URL, headers: [String:String] = [:], delegate: URLSessionTaskDelegate? = nil) async throws -> String {
        
        let boundary = UUID().uuidString
        
        let body = try document.toMultiPartData(boundary: boundary, fileURL: fileURL)
        
        let uuidData = try await self.sendRequest(method: .post, endpoint: .postDocument, body: body, multiPartBoundary: boundary, headers: headers, delegate: delegate)
        
        guard let uuidString = String(data: uuidData, encoding: .utf8)?.replacing("\"", with: "") else {
            throw ApiError.invalidResponse(uuidData, nil)
        }
        
        return uuidString
    }
    
    func get<T: ModifiableObject>(limit: Int = 25, page: Int = 1, fullPermissions: Bool = false, headers: [String:String] = [:], parameters: [String:String] = [:]) async throws -> [T] {
        return try await self.getObjects(endpoint: T.pluralEndpoint, limit: limit, page: page, fullPermissions: fullPermissions, headers: headers, parameters: parameters)
    }
    
    func get<T: ModifiableObject>(id: Int, headers: [String:String] = [:], parameters: [String:String] = [:]) async throws -> T {
        return try await self.sendRequest(method: .get, endpoint: T.singularEndpoint(id), headers: headers, parameters: parameters)
    }
    
    func create<T: ModifiableObject>(_ object: T, headers: [String:String] = [:]) async throws -> T {
        let JSONEncoder = JSONEncoder()
        let body = try JSONEncoder.encode(object)
        return try await self.sendRequest(method: .post, endpoint: T.pluralEndpoint, body: body, headers: headers)
    }
    
    func update<T: ModifiableObject>(_ object: T, headers: [String:String] = [:]) async throws -> T {
        let JSONEncoder = JSONEncoder()
        let body = try JSONEncoder.encode(object)
        return try await self.sendRequest(method: .patch, endpoint: T.singularEndpoint(object.id), body: body, headers: headers)
    }
    
    func delete<T: ModifiableObject>(_ object: T, headers: [String:String] = [:]) async throws {
        return try await self.sendRequest(method: .delete, endpoint: T.singularEndpoint(object.id), headers: headers)
    }
    
    func delete(id: Int, type: any ModifiableObject.Type, headers: [String:String] = [:]) async throws {
        return try await self.sendRequest(method: .delete, endpoint: type.singularEndpoint(id), headers: headers)
    }
}
