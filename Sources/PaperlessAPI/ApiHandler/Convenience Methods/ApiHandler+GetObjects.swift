//
//  ApiHandler+GetList.swift
//  PaperlessAPI
//
//  Created by Leo Wehrfritz on 15.12.24.
//

extension ApiHandler {
    public func getObjects<T: ListableObject>(endpoint: ApiEndpoint, limit: Int = 25, page: Int = 1, fullPermissions: Bool = false, parameters: [String:String] = [:]) async throws -> [T] {
        
        var parameters = parameters
        parameters["page_size"] = String(limit)
        parameters["page"] = String(page)
        if fullPermissions {
            parameters["full_perms"] = "true"
        }
        
        let response: PaginatedList<T> = try await self.sendRequest(method: .get, endpoint: endpoint, body: nil, parameters: parameters)
        
        return response.results
    }
}
