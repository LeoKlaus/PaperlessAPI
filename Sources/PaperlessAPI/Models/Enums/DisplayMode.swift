//
//  DisplayMode.swift
//  PaperlessAPI
//
//  Created by Leo Wehrfritz on 13.12.24.
//

public enum DisplayMode: RawRepresentable, Codable, Hashable {
    case smallCards, largeCards, table
    case unknown(String)
    
    public typealias RawValue = String
    public var rawValue: String {
        switch self {
        case .smallCards:
            return "smallCards"
        case .largeCards:
            return "largeCards"
        case .table:
            return "table"
        case .unknown(let str):
            return "unknown: \(str)"
        }
    }
    
    public init(rawValue: String) {
        switch rawValue {
        case "smallCards":
            self = .smallCards
        case "largeCards":
            self = .largeCards
        case "table":
            self = .table
        default:
            self = .unknown(rawValue)
        }
    }
}
