//
//  SocialAccount.swift
//  PaperlessAPI
//
//  Created by Leo Wehrfritz on 14.12.24.
//

public struct SocialAccount: Codable, Equatable {
    public let id: Int
    public let provider: String
    public let name: String
}
