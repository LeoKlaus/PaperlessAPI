//
//  Note.swift
//  PaperlessAPI
//
//  Created by Leo Wehrfritz on 12.12.24.
//

import Foundation

public struct Note: Codable, Equatable, Hashable {
    public let id: Int
    public let note: String?
    public let created: Date?
    public let document: Int
    public let user: Int?
    
    public init(id: Int, note: String?, created: Date?, document: Int, user: Int?) {
        self.id = id
        self.note = note
        self.created = created
        self.document = document
        self.user = user
    }
}
