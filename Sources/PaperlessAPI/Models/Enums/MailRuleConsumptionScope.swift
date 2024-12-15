//
//  MailRuleConsumptionScope.swift
//  PaperlessAPI
//
//  Created by Leo Wehrfritz on 14.12.24.
//

import Foundation

enum MailRuleConsumptionScope: RawRepresentable, Codable {
    case attachments, message, messageAndAttachments
    case unknown(Int)
    
    typealias RawValue = Int
    init(rawValue: Int) {
        switch rawValue {
        case 1: self = .attachments
        case 2: self = .message
        case 3: self = .messageAndAttachments
        default: self = .unknown(rawValue)
        }
    }
    
    var rawValue: Int {
        switch self {
        case .attachments: return 1
        case .message: return 2
        case .messageAndAttachments: return 3
        case .unknown(let value): return value
        }
    }
}
