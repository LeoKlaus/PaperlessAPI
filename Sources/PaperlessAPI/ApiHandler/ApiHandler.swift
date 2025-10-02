//
//  ApiHandler.swift
//  PaperlessAPI
//
//  Created by Leo Wehrfritz on 15.12.24.
//

import Foundation
import OSLog

public actor ApiHandler {
    
    public static let logger = Logger(
        subsystem: Bundle.main.bundleIdentifier!,
        category: String(describing: ApiHandler.self)
    )
    
    public let serverURL: URL
    private var apiToken: String
    private var session: URLSession?
    private var staticHeaders: [String:String] = [:]
    
    public init(serverURL: URL, apiToken: String, staticHeaders: [String:String] = [:], session: URLSession? = nil) {
        self.serverURL = serverURL
        self.apiToken = apiToken
        self.staticHeaders = staticHeaders
        self.session = session
    }
    
    public func setApiToken(_ apiToken: String) {
        self.apiToken = apiToken
    }
    
    public func sendRequest(method: HttpMethod, endpoint: ApiEndpoint, body: Data? = nil, multiPartBoundary: String? = nil, headers: [String:String] = [:] , parameters: [String:String] = [:], delegate: URLSessionTaskDelegate? = nil) async throws -> Data {
        
        var url = serverURL.appendingPathComponent(endpoint.rawValue)
        
        for parameter in parameters {
            url.append(queryItems: [URLQueryItem(name: parameter.key, value: parameter.value)])
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.httpBody = body
        request.addValue("Token \(apiToken)", forHTTPHeaderField: "Authorization")
        request.addValue("application/json; Version=6", forHTTPHeaderField: "Accept")
        
        if let multiPartBoundary {
            request.addValue("multipart/form-data; boundary=\(multiPartBoundary)", forHTTPHeaderField: "Content-Type")
        } else {
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        }
        
        for header in self.staticHeaders {
            request.addValue(header.value, forHTTPHeaderField: header.key)
        }
        
        for header in headers {
            request.addValue(header.value, forHTTPHeaderField: header.key)
        }
        
        let urlSession = self.session ?? URLSession.shared
        
        Self.logger.debug("Sending \(method.rawValue, privacy: .public) request to \(url.absoluteString, privacy: .public)")
        
        let (data, response) = try await urlSession.data(for: request, delegate: delegate)
        
        if let httpResponse = response as? HTTPURLResponse {
            if 200...299 ~= httpResponse.statusCode {
                return data
            } else if 403 == httpResponse.statusCode {
                Self.logger.error("Server returned 403:\n\(String(data: data, encoding: .utf8) ?? "", privacy: .public)")
                throw ApiError.forbidden
            } else if 404 == httpResponse.statusCode {
                Self.logger.error("Server returned 404:\n\(String(data: data, encoding: .utf8) ?? "", privacy: .public)")
                throw ApiError.notFound
            } else {
                Self.logger.error("Server returned unexpected status code \(httpResponse.statusCode, privacy: .public) and response:\n\(String(data: data, encoding: .utf8) ?? "", privacy: .public)\nQueried endpoint: \(endpoint.rawValue, privacy: .public)")
                throw ApiError.unexpectedHTTPStatus(data, httpResponse.statusCode)
            }
        }
        
        Self.logger.error("Server returned unexpected response:\n\(String(data: data, encoding: .utf8) ?? "", privacy: .public)")
        throw ApiError.invalidResponse(data, response)
    }
    
    public func sendRequest<T>(method: HttpMethod, endpoint: ApiEndpoint, body: Data? = nil, headers: [String:String] = [:] , parameters: [String:String] = [:], delegate: URLSessionDownloadDelegate? = nil) async throws -> T where T: Decodable {
        
        let data: Data = try await self.sendRequest(method: method, endpoint: endpoint, body: body, headers: headers, parameters: parameters, delegate: delegate)
        
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .paperlessDateDecodingStrategy
        
        return try decoder.decode(T.self, from: data)
    }
    
    public func sendRequest(method: HttpMethod, endpoint: ApiEndpoint, headers: [String:String] = [:], parameters: [String:String] = [:], delegate: URLSessionDownloadDelegate? = nil) async throws {
        
        var url = serverURL.appendingPathComponent(endpoint.rawValue)
        
        for parameter in parameters {
            url.append(queryItems: [URLQueryItem(name: parameter.key, value: parameter.value)])
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.addValue("Token \(apiToken)", forHTTPHeaderField: "Authorization")
        request.addValue("application/json; Version=6", forHTTPHeaderField: "Accept")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        for header in self.staticHeaders {
            request.addValue(header.value, forHTTPHeaderField: header.key)
        }
        
        for header in headers {
            request.addValue(header.value, forHTTPHeaderField: header.key)
        }
        
        let urlSession = self.session ?? URLSession.shared
        
        Self.logger.debug("Sending \(method.rawValue, privacy: .public) request to \(url.absoluteString, privacy: .public)")
        let (data, response) = try await urlSession.data(for: request, delegate: delegate)
        
        if let httpResponse = response as? HTTPURLResponse {
            if 200...299 ~= httpResponse.statusCode {
                return
            } else if 403 == httpResponse.statusCode {
                Self.logger.error("Server returned 403:\n\(String(data: data, encoding: .utf8) ?? "", privacy: .public)")
                throw ApiError.forbidden
            } else if 404 == httpResponse.statusCode {
                Self.logger.error("Server returned 404:\n\(String(data: data, encoding: .utf8) ?? "", privacy: .public)")
                throw ApiError.notFound
            } else {
                Self.logger.error("Server returned unexpected status code \(httpResponse.statusCode, privacy: .public) and response:\n\(String(data: data, encoding: .utf8) ?? "", privacy: .public)\nQueried endpoint: \(endpoint.rawValue, privacy: .public)")
                throw ApiError.unexpectedHTTPStatus(data, httpResponse.statusCode)
            }
        }
        
        Self.logger.error("Server returned unexpected response:\n\(String(data: data, encoding: .utf8) ?? "", privacy: .public)")
        throw ApiError.invalidResponse(data, response)
    }
    
    public func getDocumentPreview(id: Int, headers: [String:String] = [:], downloadOriginal: Bool = false, delegate: URLSessionTaskDelegate? = nil) async throws -> (String?, Data, String?) {
        
        var url = serverURL.appendingPathComponent(ApiEndpoint.documentPreview(id).rawValue)
        
        if downloadOriginal {
            url.append(queryItems:
                        [.init(name: "original", value: "true")]
            )
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = HttpMethod.get.rawValue
        request.addValue("Token \(apiToken)", forHTTPHeaderField: "Authorization")
        request.addValue("*/*", forHTTPHeaderField: "Accept")
        
        for header in self.staticHeaders {
            request.addValue(header.value, forHTTPHeaderField: header.key)
        }
        
        for header in headers {
            request.addValue(header.value, forHTTPHeaderField: header.key)
        }
        
        let urlSession = self.session ?? URLSession.shared
        
        Self.logger.debug("Sending \(HttpMethod.get.rawValue, privacy: .public) request to \(url.absoluteString, privacy: .public)")
        
        let (data, response) = try await urlSession.data(for: request, delegate: delegate)
        
        if let httpResponse = response as? HTTPURLResponse {
            if 200...299 ~= httpResponse.statusCode {
                return (response.mimeType, data, httpResponse.suggestedFilename)
            } else if 403 == httpResponse.statusCode {
                Self.logger.error("Server returned 403:\n\(String(data: data, encoding: .utf8) ?? "", privacy: .public)")
                throw ApiError.forbidden
            } else if 404 == httpResponse.statusCode {
                Self.logger.error("Server returned 404:\n\(String(data: data, encoding: .utf8) ?? "", privacy: .public)")
                throw ApiError.notFound
            } else {
                Self.logger.error("Server returned unexpected status code \(httpResponse.statusCode, privacy: .public) and response:\n\(String(data: data, encoding: .utf8) ?? "", privacy: .public)\nQueried endpoint: \(HttpMethod.get.rawValue, privacy: .public)")
                throw ApiError.unexpectedHTTPStatus(data, httpResponse.statusCode)
            }
        }
        
        Self.logger.error("Server returned unexpected response:\n\(String(data: data, encoding: .utf8) ?? "", privacy: .public)")
        throw ApiError.invalidResponse(data, response)
    }
}
