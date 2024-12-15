//
//  TaskStatus.swift
//  PaperlessAPI
//
//  Created by Leo Wehrfritz on 13.12.24.
//

import Foundation

// These are from Celery
public enum TaskStatus: RawRepresentable, Codable {
    case pending, started, success, failure, retry, revoked
    case unknown(String)
    
    public typealias RawValue = String
    public var rawValue: String {
        switch self {
        case .pending:
            return "PENDING"
        case .started:
            return "STARTED"
        case .success:
            return "SUCCESS"
        case .failure:
            return "FAILURE"
        case .retry:
            return "RETRY"
        case .revoked:
            return "REVOKED"
        case .unknown(let str):
            return "unknown: \(str)"
        }
    }
    
    public init(rawValue: String) {
        switch rawValue {
        case "PENDING":
            self = .pending
        case "STARTED":
            self = .started
        case "SUCCESS":
            self = .success
        case "FAILURE":
            self = .failure
        case "RETRY":
            self = .retry
        case "REVOKED":
            self = .revoked
        default:
            self = .unknown(rawValue)
        }
    }
}
