//
//  ApiHandler+GetAuthToken.swift
//  PaperlessAPI
//
//  Created by Leo Wehrfritz on 15.12.24.
//

import Foundation

public extension ApiHandler {
    static func getAuthToken(for serverURL: URL, user: String, password: String) async throws -> String {
        let url = serverURL.appendingPathComponent(ApiEndpoint.token.rawValue)
        
        let body = [
            "username": user,
            "password": password
        ]
        
        var request = URLRequest(url: url)
        
        request.httpMethod = "POST"
        request.httpBody = try JSONEncoder().encode(body)
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        if let httpResponse = response as? HTTPURLResponse {
            if 200...299 ~= httpResponse.statusCode {
                let decoder = JSONDecoder()
                let token = try decoder.decode(String.self, from: data)
                return token
            } else if 403 == httpResponse.statusCode {
                throw ApiError.forbidden
            } else {
                throw ApiError.unexpectedHTTPStatus(data, httpResponse.statusCode)
            }
        }
        
        throw ApiError.invalidResponse(data, response)
    }
}
