//
//  Profile.swift
//  PaperlessAPI
//
//  Created by Leo Wehrfritz on 14.12.24.
//

struct Profile: Codable {
    let email: String
    let password: String
    let firstName: String
    let lastName: String
    let authToken: String
    let socialAccounts: [SocialAccount]
    let hasUsablePassword: Bool
    
    enum CodingKeys: String, CodingKey {
        case email
        case password
        case firstName = "first_name"
        case lastName = "last_name"
        case authToken = "auth_token"
        case socialAccounts = "social_accounts"
        case hasUsablePassword = "has_usable_password"
    }
}
