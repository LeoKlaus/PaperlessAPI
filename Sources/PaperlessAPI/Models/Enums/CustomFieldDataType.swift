//
//  CustomFieldDataType.swift
//  PaperlessAPI
//
//  Created by Leo Wehrfritz on 13.12.24.
//

public enum CustomFieldDataType: RawRepresentable, Codable, Hashable, Sendable {
    case string, url, date, boolean, integer, float, monetary, documentlink, select
    case unknown(String)
    
    public typealias RawValue = String
    public var rawValue: String {
        switch self {
        case .string:
            return "string"
        case .url:
            return "url"
        case .date:
            return "date"
        case .boolean:
            return "boolean"
        case .integer:
            return "integer"
        case .float:
            return "float"
        case .monetary:
            return "monetary"
        case .documentlink:
            return "documentlink"
        case .select:
            return "select"
        case .unknown(let str):
            return "unknown: \(str)"
        }
    }
    
    public init(rawValue: String) {
        switch rawValue {
        case "string":
            self = .string
        case "url":
            self = .url
        case "date":
            self = .date
        case "boolean":
            self = .boolean
        case "integer":
            self = .integer
        case "float":
            self = .float
        case "monetary":
            self = .monetary
        case "documentlink":
            self = .documentlink
        case "select":
            self = .select
        default:
            self = .unknown(rawValue)
        }
    }
}
