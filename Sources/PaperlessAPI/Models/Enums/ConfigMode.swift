//
//  ConfigMode.swift
//  PaperlessAPI
//
//  Created by Leo Wehrfritz on 14.12.24.
//

public enum ConfigMode: RawRepresentable, Codable, Equatable, Sendable {
    case skip, redo, force, skipNoArchive
    case unknown(String)
    
    public typealias RawValue = String
    public init(rawValue: String) {
        switch rawValue {
        case "skip": self = .skip
        case "redo": self = .redo
        case "force": self = .force
        case "skip_noarchive": self = .skipNoArchive
        default: self = .unknown(rawValue)
        }
    }
    
    public var rawValue: String {
        switch self {
        case .skip: return "skip"
        case .redo: return "redo"
        case .force: return "force"
        case .skipNoArchive: return "skip_noarchive"
        case .unknown(let rawValue): return rawValue
        }
    }
}
