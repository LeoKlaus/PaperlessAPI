//
//  Profile.swift
//  PaperlessAPI
//
//  Created by Leo Wehrfritz on 14.12.24.
//

public struct Profile: Codable, Sendable {
    public let email: String
    public let password: String
    public let firstName: String
    public let lastName: String
    public let authToken: String
    public let socialAccounts: [SocialAccount]
    public let hasUsablePassword: Bool
    
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
