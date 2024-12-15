//
//  MailRuleAttachmentType.swift
//  PaperlessAPI
//
//  Created by Leo Wehrfritz on 14.12.24.
//

import Foundation

enum MailRuleAttachmentType: RawRepresentable, Codable {
    case attachments, allFiles
    case unknown(Int)
    
    typealias RawValue = Int
    init(rawValue: Int) {
        switch rawValue {
        case 1: self = .attachments
        case 2: self = .allFiles
        default: self = .unknown(rawValue)
        }
    }
    
    var rawValue: Int {
        switch self {
        case .attachments: return 1
        case .allFiles: return 2
        case .unknown(let value): return value
        }
    }
}
