//
//  ApiHandler+GetRemoteVersion.swift
//  PaperlessAPI
//
//  Created by Leo Wehrfritz on 17.12.24.
//

import Foundation

public extension ApiHandler {
    static func getRemoteVersion(serverURL: URL, headers: [String: String] = [:], session: URLSession = URLSession.shared) async throws -> RemoteVersion {
        let url = serverURL.appendingPathComponent(ApiEndpoint.remoteVersion.rawValue)
        
        var request = URLRequest(url: url)
        
        request.httpMethod = HttpMethod.get.rawValue
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        for header in headers {
            request.addValue(header.value, forHTTPHeaderField: header.key)
        }
        
        let (data, response) = try await session.data(for: request)
        
        if let httpResponse = response as? HTTPURLResponse {
            if 200...299 ~= httpResponse.statusCode {
                let decoder = JSONDecoder()
                return try decoder.decode(RemoteVersion.self, from: data)
            } else if 401 == httpResponse.statusCode {
                throw ApiError.noCredentials
            } else if 403 == httpResponse.statusCode {
                throw ApiError.forbidden
            } else {
                throw ApiError.unexpectedHTTPStatus(data, httpResponse.statusCode)
            }
        }
        
        throw ApiError.invalidResponse(data, response)
    }
}
