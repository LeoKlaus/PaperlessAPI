//
//  ConfigOutputType.swift
//  PaperlessAPI
//
//  Created by Leo Wehrfritz on 14.12.24.
//

public enum ConfigOutputType: RawRepresentable, Codable, Equatable {
    case pdf, pdfa, pdfa1, pdfa2, pdfa3
    case unknown(String)
    
    public typealias RawValue = String
    public init?(rawValue: String) {
        switch rawValue {
        case "pdf": self = .pdf
        case "pdfa": self = .pdfa
        case "pdfa-1": self = .pdfa1
        case "pdfa-2": self = .pdfa2
        case "pdfa-3": self = .pdfa3
        default: self = .unknown(rawValue)
        }
    }
    
    public var rawValue: String {
        switch self {
        case .pdf: return "pdf"
        case .pdfa: return "pdfa"
        case .pdfa1: return "pdfa-1"
        case .pdfa2: return "pdfa-2"
        case .pdfa3: return "pdfa-3"
        case .unknown(let rawValue): return rawValue
        }
    }
}
