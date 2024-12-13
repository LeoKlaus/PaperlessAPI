//
//  DisplayMode.swift
//  PaperlessAPI
//
//  Created by Leo Wehrfritz on 13.12.24.
//

enum DisplayMode: RawRepresentable, Codable, Equatable {
    case smallCards, largeCards, table
    case unknown(String)
    
    typealias RawValue = String
    var rawValue: String {
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
    
    init(rawValue: String) {
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
