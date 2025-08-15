//
//  HttpMethod.swift
//  PaperlessAPI
//
//  Created by Leo Wehrfritz on 15.12.24.
//

public enum HttpMethod: String, Sendable {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
    case patch = "PATCH"
}
