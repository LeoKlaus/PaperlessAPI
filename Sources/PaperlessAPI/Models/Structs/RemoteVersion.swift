//
//  RemoteVersion.swift
//  PaperlessAPI
//
//  Created by Leo Wehrfritz on 14.12.24.
//

public struct RemoteVersion: Codable {
    let version: String
    let updateAvailable: Bool
    
    enum CodingKeys: String, CodingKey {
        case version
        case updateAvailable = "update_available"
    }
}
