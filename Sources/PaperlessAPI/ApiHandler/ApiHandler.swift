//
//  ApiHandler.swift
//  PaperlessAPI
//
//  Created by Leo Wehrfritz on 15.12.24.
//

import Foundation
import OSLog

public class ApiHandler {
    
    private static let logger = Logger(
        subsystem: Bundle.main.bundleIdentifier!,
        category: String(describing: ApiHandler.self)
    )
    
    public var serverURL: URL?
    public var apiToken: String?
    
    public init(serverURL: URL? = nil, apiToken: String? = nil) {
        self.serverURL = serverURL
        self.apiToken = apiToken
    }
    
    public func sendRequest<T: Codable>(method: HttpMethod, endpoint: ApiEndpoint, body: Data? = nil, parameters: [String:String] = [:]) async throws -> T {
        
        guard let serverURL, let apiToken else {
            throw ApiError.noCredentials
        }
        
        var url = serverURL.appendingPathComponent(endpoint.rawValue)
        
        for parameter in parameters {
            url.append(queryItems: [URLQueryItem(name: parameter.key, value: parameter.value)])
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.httpBody = body
        request.addValue("Token \(apiToken)", forHTTPHeaderField: "Authorization")
        request.addValue("application/json; Version=4", forHTTPHeaderField: "Accept")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let urlSession = URLSession.shared
        
        Self.logger.debug("Sending \(method.rawValue) request to \(url.absoluteString)")
        let (data, response) = try await urlSession.data(for: request)
        
        if let httpResponse = response as? HTTPURLResponse {
            if 200...299 ~= httpResponse.statusCode {
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .paperlessDateDecodingStrategy
                
                let object = try decoder.decode(T.self, from: data)
                return object
            } else if 403 == httpResponse.statusCode {
                Self.logger.error("Server returned 403:\n\(String(data: data, encoding: .utf8) ?? "")")
                throw ApiError.forbidden
            } else if 404 == httpResponse.statusCode {
                Self.logger.error("Server returned 404:\n\(String(data: data, encoding: .utf8) ?? "")")
                throw ApiError.notFound
            } else {
                Self.logger.error("Server returned unexpected status code \(httpResponse.statusCode) and response:\n\(String(data: data, encoding: .utf8) ?? "")\nQueried endpoint: \(endpoint.rawValue, privacy: .public)")
                throw ApiError.unexpectedHTTPStatus(data, httpResponse.statusCode)
            }
        }
        
        Self.logger.error("Server returned unexpected response:\n\(String(data: data, encoding: .utf8) ?? "")")
        throw ApiError.invalidResponse(data, response)
    }
    
    public func sendRequest(method: HttpMethod, endpoint: ApiEndpoint, parameters: [String:String] = [:]) async throws {
        
        guard let serverURL, let apiToken else {
            throw ApiError.noCredentials
        }
        
        var url = serverURL.appendingPathComponent(endpoint.rawValue)
        
        for parameter in parameters {
            url.append(queryItems: [URLQueryItem(name: parameter.key, value: parameter.value)])
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.addValue("Token \(apiToken)", forHTTPHeaderField: "Authorization")
        request.addValue("application/json; Version=4", forHTTPHeaderField: "Accept")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let urlSession = URLSession.shared
        
        Self.logger.debug("Sending \(method.rawValue) request to \(url.absoluteString)")
        let (data, response) = try await urlSession.data(for: request)
        
        if let httpResponse = response as? HTTPURLResponse {
            if 200...299 ~= httpResponse.statusCode {
                return
            } else if 403 == httpResponse.statusCode {
                Self.logger.error("Server returned 403:\n\(String(data: data, encoding: .utf8) ?? "")")
                throw ApiError.forbidden
            } else if 404 == httpResponse.statusCode {
                Self.logger.error("Server returned 404:\n\(String(data: data, encoding: .utf8) ?? "")")
                throw ApiError.notFound
            } else {
                Self.logger.error("Server returned unexpected status code \(httpResponse.statusCode) and response:\n\(String(data: data, encoding: .utf8) ?? "")\nQueried endpoint: \(endpoint.rawValue, privacy: .public)")
                throw ApiError.unexpectedHTTPStatus(data, httpResponse.statusCode)
            }
        }
        
        Self.logger.error("Server returned unexpected response:\n\(String(data: data, encoding: .utf8) ?? "")")
        throw ApiError.invalidResponse(data, response)
    }
}
