//
//  SocialAccount.swift
//  PaperlessAPI
//
//  Created by Leo Wehrfritz on 14.12.24.
//

struct SocialAccount: Codable, Equatable {
    let id: Int
    let provider: String
    let name: String
}
