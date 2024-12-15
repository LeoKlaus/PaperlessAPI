//
//  ShareLinkFileVersion.swift
//  PaperlessAPI
//
//  Created by Leo Wehrfritz on 14.12.24.
//

public enum ShareLinkFileVersion: RawRepresentable, Codable {
    case archive, original
    case unknown(String)
    
    public typealias RawValue = String
    public init(rawValue: String) {
        switch rawValue {
        case "archive": self = .archive
        case "original": self = .original
        default: self = .unknown(rawValue)
        }
    }
    
    public var rawValue: String {
        switch self {
        case .archive: return "archive"
        case .original: return "original"
        case .unknown(let rawValue): return rawValue
        }
    }
}
