//
//  MailEncryptionPolicy.swift
//  PaperlessAPI
//
//  Created by Leo Wehrfritz on 14.12.24.
//

import Foundation

enum MailEncryptionPolicy: RawRepresentable, Codable {
    case none, ssl, starttls
    case unknown(Int)
    
    init(rawValue: Int) {
        switch rawValue {
        case 1: self = .none
        case 2: self = .ssl
        case 3: self = .starttls
        default: self = .unknown(rawValue)
        }
    }
    
    var rawValue: Int {
        switch self {
        case .none: return 1
        case .ssl: return 2
        case .starttls: return 3
        case .unknown(let value): return value
        }
    }
}
