//
//  MailRuleCorrespondentSource.swift
//  PaperlessAPI
//
//  Created by Leo Wehrfritz on 14.12.24.
//

import Foundation

public enum MailRuleCorrespondentSource: RawRepresentable, Codable {
    case doNotAssign, mailAddress, name, selected
    case unknown(Int)
    
    public typealias RawValue = Int
    public init(rawValue: Int) {
        switch rawValue {
        case 1: self = .doNotAssign
        case 2: self = .mailAddress
        case 3: self = .name
        case 4: self = .selected
        default: self = .unknown(rawValue)
        }
    }
    
    public var rawValue: Int {
        switch self {
        case .doNotAssign: return 1
        case .mailAddress: return 2
        case .name: return 3
        case .selected: return 4
        case .unknown(let value): return value
        }
    }
}
