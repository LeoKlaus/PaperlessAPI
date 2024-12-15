//
//  MailRuleAction.swift
//  PaperlessAPI
//
//  Created by Leo Wehrfritz on 14.12.24.
//

import Foundation

enum MailRuleAction: RawRepresentable, Codable, Equatable {
    case delete, move, markAsRead, flag, tag
    case unknown(Int)
    
    typealias RawValue = Int
    init?(rawValue: Int) {
        switch rawValue {
        case 1: self = .delete
        case 2: self = .move
        case 3: self = .markAsRead
        case 4: self = .flag
        case 5: self = .tag
        default: self = .unknown(rawValue)
        }
    }
    
    var rawValue: Int {
        switch self {
        case .delete: return 1
        case .move: return 2
        case .markAsRead: return 3
        case .flag: return 4
        case .tag: return 5
        case .unknown(let value): return value
        }
    }
}
