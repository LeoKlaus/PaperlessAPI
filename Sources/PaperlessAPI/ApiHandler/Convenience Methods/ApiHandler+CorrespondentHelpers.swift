//
//  ApiHandler+CorrespondentHelpers.swift
//  PaperlessAPI
//
//  Created by Leo Wehrfritz on 15.12.24.
//

import Foundation

extension ApiHandler {
    public func getCorrespondents(limit: Int = 25, page: Int = 1, fullPermissions: Bool = false, parameters: [String:String] = [:]) async throws -> [Correspondent] {
        return try await self.getObjects(endpoint: .correspondents, limit: limit, page: page, fullPermissions: fullPermissions, parameters: parameters)
    }
    
    public func getCorrespondent(id: Int) async throws -> Correspondent {
        return try await self.sendRequest(method: .get, endpoint: .correspondent(id))
    }
    
    public func createCorrespondent(_ correspondent: Correspondent) async throws -> Correspondent {
        let JSONEncoder = JSONEncoder()
        let body = try JSONEncoder.encode(correspondent)
        return try await self.sendRequest(method: .post, endpoint: .correspondents, body: body)
    }
    
    public func updateCorrespondent(_ correspondent: Correspondent) async throws -> Correspondent {
        let JSONEncoder = JSONEncoder()
        let body = try JSONEncoder.encode(correspondent)
        return try await self.sendRequest(method: .patch, endpoint: .correspondent(correspondent.id), body: body)
    }
    
    public func deleteCorrespondent(_ correspondent: Correspondent) async throws {
        return try await self.sendRequest(method: .delete, endpoint: .correspondent(correspondent.id))
    }
    
    public func deleteCorrespondent(id: Int) async throws {
        return try await self.sendRequest(method: .delete, endpoint: .correspondent(id))
    }
}
