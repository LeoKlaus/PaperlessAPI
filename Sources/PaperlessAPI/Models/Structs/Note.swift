//
//  Note.swift
//  PaperlessAPI
//
//  Created by Leo Wehrfritz on 12.12.24.
//

import Foundation

public struct Note: Codable, Equatable {
    let id: Int
    let note: String?
    let created: Date?
    let document: Int
    let user: Int?
}
