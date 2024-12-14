//
//  MatchingAlgorithm.swift
//  PaperlessAPI
//
//  Created by Leo Wehrfritz on 13.12.24.
//

// Ref: https://github.com/paperless-ngx/paperless-ngx/blob/dev/src/documents/models.py#L48
enum MatchingAlgorithm: RawRepresentable, Codable, Equatable {
    case matchNone      //0
    case matchAny       //1
    case matchAll       //2
    case matchLiteral   //3
    case matchRegex     //4
    case matchFuzzy     //5
    case matchAuto      //6
    case unknown(Int)
    
    typealias RawValue = Int
    var rawValue: Int {
        switch self {
        case .matchNone:
            return 0
        case .matchAny:
            return 1
        case .matchAll:
            return 2
        case .matchLiteral:
            return 3
        case .matchRegex:
            return 4
        case .matchFuzzy:
            return 5
        case .matchAuto:
            return 6
        case .unknown(let int):
            return int
        }
    }
    
    init(rawValue: Int) {
        switch rawValue {
        case 0:
            self = .matchNone
        case 1:
            self = .matchAny
        case 2:
            self = .matchAll
        case 3:
            self = .matchLiteral
        case 4:
            self = .matchRegex
        case 5:
            self = .matchFuzzy
        case 6:
            self = .matchAuto
        default:
            self = .unknown(rawValue)
        }
    }
}
