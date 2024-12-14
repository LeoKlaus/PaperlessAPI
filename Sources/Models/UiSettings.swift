//
//  UiSettings.swift
//  PaperlessAPI
//
//  Created by Leo Wehrfritz on 14.12.24.
//

struct UiSettings: Codable {
    let user: User
    let settings: Settings
    let permissions: [Permission]
}
