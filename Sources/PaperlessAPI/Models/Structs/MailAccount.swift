//
//  File.swift
//  PaperlessAPI
//
//  Created by Leo Wehrfritz on 14.12.24.
//

import Foundation

public struct MailAccount: PaperlessObject {
    public let id: Int
    let name: String
    let imapServer: String
    let imapPort: Int?
    let imapSecurity: MailEncryptionPolicy
    let username: String
    let password: String
    let characterSet: String
    let isToken: Bool
    let owner: Int
    let userCanChange: Bool
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case imapServer = "imap_server"
        case imapPort = "imap_port"
        case imapSecurity = "imap_security"
        case username
        case password
        case characterSet = "character_set"
        case isToken = "is_token"
        case owner
        case userCanChange = "user_can_change"
    }
}
