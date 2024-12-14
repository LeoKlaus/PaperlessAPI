//
//  ShareLinkFileVersion.swift
//  PaperlessAPI
//
//  Created by Leo Wehrfritz on 14.12.24.
//

enum ShareLinkFileVersion: RawRepresentable, Codable {
    case archive, original
    case unknown(String)
    
    typealias RawValue = String
    init(rawValue: String) {
        switch rawValue {
        case "archive": self = .archive
        case "original": self = .original
        default: self = .unknown(rawValue)
        }
    }
    
    var rawValue: String {
        switch self {
        case .archive: return "archive"
        case .original: return "original"
        case .unknown(let rawValue): return rawValue
        }
    }
}
