//
//  RemoteVersion.swift
//  PaperlessAPI
//
//  Created by Leo Wehrfritz on 14.12.24.
//

public struct RemoteVersion: Codable, Sendable {
    public let version: String
    public let updateAvailable: Bool
    
    enum CodingKeys: String, CodingKey {
        case version
        case updateAvailable = "update_available"
    }
    
    public init(version: String, updateAvailable: Bool) {
        self.version = version
        self.updateAvailable = updateAvailable
    }
}
