//
//  File.swift
//  PaperlessAPI
//
//  Created by Leo Wehrfritz on 14.12.24.
//

import Foundation

public struct MailAccount: PaperlessObject {
    public let id: Int
    public let name: String
    public let imapServer: String
    public let imapPort: Int?
    public let imapSecurity: MailEncryptionPolicy
    public let username: String
    public let password: String
    public let characterSet: String
    public let isToken: Bool
    public let owner: Int
    public let userCanChange: Bool?
    public let permissions: ObjectPermissions?
    
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
        case permissions
    }
}
