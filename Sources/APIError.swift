//
//  APIError.swift
//  PaperlessAPI
//
//  Created by Leo Wehrfritz on 15.12.24.
//

import Foundation

enum APIError: Error {
    case noCredentials
    case forbidden
    case invalidResponse(Data, URLResponse)
    case unexpectedHTTPStatus(Data, Int)
}
