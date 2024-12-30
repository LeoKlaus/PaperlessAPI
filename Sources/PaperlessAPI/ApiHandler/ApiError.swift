//
//  ApiError.swift
//  PaperlessAPI
//
//  Created by Leo Wehrfritz on 15.12.24.
//

import Foundation

public enum ApiError: Error {
    case noCredentials
    case forbidden
    case notFound
    case invalidResponse(Data, URLResponse?)
    case unexpectedHTTPStatus(Data, Int)
    case couldntSerializeDocument
}
