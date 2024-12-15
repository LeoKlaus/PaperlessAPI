//
//  File.swift
//  PaperlessAPI
//
//  Created by Leo Wehrfritz on 13.12.24.
//

// Ref: https://github.com/paperless-ngx/paperless-ngx/blob/dev/src/documents/serialisers.py#L1621
public enum TaskType: RawRepresentable, Codable {
    case file
    case unknown(String)
    
    public typealias RawValue = String
    public var rawValue: String {
        switch self {
        case .file:
            return "file"
        case .unknown(let str):
            return "unknown: \(str)"
        }
    }
    
    public init(rawValue: String) {
        switch rawValue {
        case "file":
            self = .file
        default:
            self = .unknown(rawValue)
        }
    }
}
