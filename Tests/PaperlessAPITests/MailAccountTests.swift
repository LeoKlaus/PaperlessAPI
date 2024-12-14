//
//  File.swift
//  PaperlessAPI
//
//  Created by Leo Wehrfritz on 14.12.24.
//

import Testing
import Foundation
@testable import PaperlessAPI

@Test func decodeMailAccount() async throws {
    
    let json = """
{
  "id": 2,
  "name": "My Mail Account",
  "imap_server": "smtp.mail.me",
  "imap_port": 587,
  "imap_security": 3,
  "username": "test",
  "password": "****",
  "character_set": "UTF-8",
  "is_token": false,
  "owner": 3,
  "user_can_change": true
}
""".data(using: .utf8)!
    
    
    let decoder = JSONDecoder()
    let mailAccount = try decoder.decode(MailAccount.self, from: json)
    
    #expect(mailAccount.id == 2)
    #expect(mailAccount.name == "My Mail Account")
    #expect(mailAccount.imapServer == "smtp.mail.me")
    #expect(mailAccount.imapPort == 587)
    #expect(mailAccount.imapSecurity == .starttls)
    #expect(mailAccount.username == "test")
    #expect(mailAccount.password == "****")
    #expect(mailAccount.characterSet == "UTF-8")
    #expect(mailAccount.isToken == false)
    #expect(mailAccount.owner == 3)
    #expect(mailAccount.userCanChange == true)
}
