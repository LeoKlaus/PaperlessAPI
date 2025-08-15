//
//  MailRuleAttachmentType.swift
//  PaperlessAPI
//
//  Created by Leo Wehrfritz on 14.12.24.
//

import Foundation

public enum MailRuleAttachmentType: RawRepresentable, Codable, Sendable {
    case attachments, allFiles
    case unknown(Int)
    
    public typealias RawValue = Int
    public init(rawValue: Int) {
        switch rawValue {
        case 1: self = .attachments
        case 2: self = .allFiles
        default: self = .unknown(rawValue)
        }
    }
    
    public var rawValue: Int {
        switch self {
        case .attachments: return 1
        case .allFiles: return 2
        case .unknown(let value): return value
        }
    }
}
