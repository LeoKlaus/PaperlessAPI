//
//  MailRuleTitleSource.swift
//  PaperlessAPI
//
//  Created by Leo Wehrfritz on 14.12.24.
//

import Foundation

public enum MailRuleTitleSource: RawRepresentable, Codable, Sendable {
    case subject, attachment, doNotAssign
    case unknown(Int)
    
    public typealias RawValue = Int
    public init?(rawValue: Int) {
        switch rawValue {
        case 1: self = .subject
        case 2: self = .attachment
        case 3: self = .doNotAssign
        default: self = .unknown(rawValue)
        }
    }
    
    public var rawValue: Int {
        switch self {
        case .subject: return 1
        case .attachment: return 2
        case .doNotAssign: return 3
        case .unknown(let value): return value
        }
    }
}
