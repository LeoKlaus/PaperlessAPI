//
//  Group.swift
//  PaperlessAPI
//
//  Created by Leo Wehrfritz on 14.12.24.
//

import Foundation

struct Group: Codable {
    let id: Int
    let name: String
    let permissions: [Permission]
}
