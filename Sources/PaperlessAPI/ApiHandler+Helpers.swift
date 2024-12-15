//
//  ApiHandler+GetDocuments.swift
//  PaperlessAPI
//
//  Created by Leo Wehrfritz on 15.12.24.
//

extension ApiHandler {
    func getDocuments(limit: Int = 25, page: Int = 1, parameters: [String:String] = [:]) async throws -> [Document] {
        return try await self.getObjects(endpoint: .documents, limit: limit, page: page, parameters: parameters)
    }
        
}
