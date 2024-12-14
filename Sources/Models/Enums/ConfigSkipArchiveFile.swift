//
//  ConfigSkipArchiveFile.swift
//  PaperlessAPI
//
//  Created by Leo Wehrfritz on 14.12.24.
//

enum ConfigSkipArchiveFile: RawRepresentable, Codable, Equatable {
    case never, withText, always
    case unknown(String)
    
    typealias RawValue = String
    init(rawValue: RawValue) {
        switch rawValue {
        case "never": self = .never
        case "with_text": self = .withText
        case "always": self = .always
        default: self = .unknown(rawValue)
        }
    }
    
    var rawValue: RawValue {
        switch self {
        case .never: return "never"
        case .withText: return "with_text"
        case .always: return "always"
        case .unknown(let rawValue): return rawValue
        }
    }
}
