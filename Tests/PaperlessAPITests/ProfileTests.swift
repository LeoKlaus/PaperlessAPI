//
//  ProfileTests.swift
//  PaperlessAPI
//
//  Created by Leo Wehrfritz on 14.12.24.
//

import Testing
import Foundation
@testable import PaperlessAPI

@Test func decodeProfile() async throws {
    
    let json = """
{
    "email": "contact@wehrfritz.me",
    "password": "**********",
    "first_name": "Leo",
    "last_name": "Wehrfritz",
    "auth_token": "123abc",
    "social_accounts": [
        {
            "id": 1,
            "provider": "github",
            "name": "LeoKlaus"
        }
    ],
    "has_usable_password": true
}
""".data(using: .utf8)!
    
    
    let decoder = JSONDecoder()
    let profile = try decoder.decode(Profile.self, from: json)
    
    #expect(profile.email == "contact@wehrfritz.me")
    #expect(profile.password == "**********")
    #expect(profile.firstName == "Leo")
    #expect(profile.lastName == "Wehrfritz")
    #expect(profile.authToken == "123abc")
    #expect(profile.socialAccounts == [
        SocialAccount(id: 1, provider: "github", name: "LeoKlaus")
    ])
    #expect(profile.hasUsablePassword)
}
