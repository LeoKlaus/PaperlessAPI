//
//  ApiHandler+CRUDHelpers.swift
//  PaperlessAPI
//
//  Created by Leo Wehrfritz on 16.12.24.
//

import Foundation

extension ApiHandler {
    public func get<T: ModifiableObject>(limit: Int = 25, page: Int = 1, fullPermissions: Bool = false, parameters: [String:String] = [:]) async throws -> [T] {
        return try await self.getObjects(endpoint: T.pluralEndpoint, limit: limit, page: page, fullPermissions: fullPermissions, parameters: parameters)
    }
    
    public func get<T: ModifiableObject>(id: Int, parameters: [String:String] = [:]) async throws -> T {
        return try await self.sendRequest(method: .get, endpoint: T.singularEndpoint(id), parameters: parameters)
    }
    
    public func create<T: ModifiableObject>(_ object: T) async throws -> T {
        let JSONEncoder = JSONEncoder()
        let body = try JSONEncoder.encode(object)
        return try await self.sendRequest(method: .post, endpoint: T.pluralEndpoint, body: body)
    }
    
    public func update<T: ModifiableObject>(_ object: T) async throws -> T {
        let JSONEncoder = JSONEncoder()
        let body = try JSONEncoder.encode(object)
        return try await self.sendRequest(method: .patch, endpoint: T.singularEndpoint(object.id), body: body)
    }
    
    public func delete<T: ModifiableObject>(_ object: T) async throws {
        return try await self.sendRequest(method: .delete, endpoint: T.singularEndpoint(object.id))
    }
    
    public func delete(id: Int, type: ModifiableObject.Type) async throws {
        return try await self.sendRequest(method: .delete, endpoint: type.singularEndpoint(id))
    }
}
