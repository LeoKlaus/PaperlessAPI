//
//  ConfigSkipArchiveFile.swift
//  PaperlessAPI
//
//  Created by Leo Wehrfritz on 14.12.24.
//

public enum ConfigSkipArchiveFile: RawRepresentable, Codable, Equatable, Sendable {
    case never, withText, always
    case unknown(String)
    
    public typealias RawValue = String
    public init(rawValue: RawValue) {
        switch rawValue {
        case "never": self = .never
        case "with_text": self = .withText
        case "always": self = .always
        default: self = .unknown(rawValue)
        }
    }
    
    public var rawValue: RawValue {
        switch self {
        case .never: return "never"
        case .withText: return "with_text"
        case .always: return "always"
        case .unknown(let rawValue): return rawValue
        }
    }
}
