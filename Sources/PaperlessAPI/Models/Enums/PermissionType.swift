//
//  PermissionType.swift
//  PaperlessAPI
//
//  Created by Leo Wehrfritz on 13.12.24.
//


public enum PermissionType: RawRepresentable, Codable, Sendable {
    case add, change, delete, view
    case unknown(String)
    
    public typealias RawValue = String
    public var rawValue: String {
        switch self {
        case .add:
            return "add"
        case .change:
            return "change"
        case .delete:
            return "delete"
        case .view:
            return "view"
        case .unknown(let str):
            return "unknown: \(str)"
        }
    }
    
    public init(rawValue: String) {
        switch rawValue {
        case "add":
            self = .add
        case "change":
            self = .change
        case "delete":
            self = .delete
        case "view":
            self = .view
        default:
            self = .unknown(rawValue)
        }
    }
}
