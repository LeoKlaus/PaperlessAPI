//
//  UiSettings.swift
//  PaperlessAPI
//
//  Created by Leo Wehrfritz on 14.12.24.
//

public struct UiSettings: Codable, Sendable {
    public let user: User
    public let settings: Settings
    public let permissions: [PaperlessPermission]
    
    public init(user: User, settings: Settings, permissions: [PaperlessPermission]) {
        self.user = user
        self.settings = settings
        self.permissions = permissions
    }
}
