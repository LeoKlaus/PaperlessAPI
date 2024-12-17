//
//  Note.swift
//  PaperlessAPI
//
//  Created by Leo Wehrfritz on 12.12.24.
//

import Foundation

public struct Note: Codable, Equatable {
    public let id: Int
    public let note: String?
    public let created: Date?
    public let document: Int
    public let user: Int?
}
