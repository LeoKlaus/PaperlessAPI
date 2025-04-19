//
//  Note.swift
//  PaperlessAPI
//
//  Created by Leo Wehrfritz on 12.12.24.
//

import Foundation

public struct Note: Codable, Equatable, Hashable {
    public var id: Int
    public let note: String?
    public let created: Date?
    public let user: Int?
    
    public init(id: Int, note: String?, created: Date?, user: Int?) {
        self.id = id
        self.note = note
        self.created = created
        self.user = user
    }
    
    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.note = try container.decodeIfPresent(String.self, forKey: .note)
        self.created = try container.decodeIfPresent(Date.self, forKey: .created)
        if let user = try? container.decodeIfPresent(User.self, forKey: .user) {
            self.user = user.id
        } else {
            self.user = try container.decodeIfPresent(Int.self, forKey: .user)
        }
    }
}
