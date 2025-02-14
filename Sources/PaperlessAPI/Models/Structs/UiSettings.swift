//
//  UiSettings.swift
//  PaperlessAPI
//
//  Created by Leo Wehrfritz on 14.12.24.
//

public struct UiSettings: Codable {
    public let user: User
    public let settings: Settings
    public let permissions: [PaperlessPermission]
}
