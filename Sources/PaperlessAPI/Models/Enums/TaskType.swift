//
//  File.swift
//  PaperlessAPI
//
//  Created by Leo Wehrfritz on 13.12.24.
//

// Ref: https://github.com/paperless-ngx/paperless-ngx/blob/dev/src/documents/serialisers.py#L1621
enum TaskType: RawRepresentable, Codable {
    case file
    case unknown(String)
    
    typealias RawValue = String
    var rawValue: String {
        switch self {
        case .file:
            return "file"
        case .unknown(let str):
            return "unknown: \(str)"
        }
    }
    
    init(rawValue: String) {
        switch rawValue {
        case "file":
            self = .file
        default:
            self = .unknown(rawValue)
        }
    }
}
