//
//  ConfigUnpaperClean.swift
//  PaperlessAPI
//
//  Created by Leo Wehrfritz on 14.12.24.
//

public enum ConfigUnpaperClean: RawRepresentable, Codable, Equatable, Sendable {
    case clean, cleanFinal, none
    case unknown(String)
    
    public typealias RawValue = String
    public init(rawValue: String) {
        switch rawValue {
        case "clean": self = .clean
        case "clean-final": self = .cleanFinal
        case "none": self = .none
        default: self = .unknown(rawValue)
        }
    }
    
    public var rawValue: String {
        switch self {
        case .clean: return "clean"
        case .cleanFinal: return "clean-final"
        case .none: return "none"
        case .unknown(let rawValue): return rawValue
        }
    }
}
