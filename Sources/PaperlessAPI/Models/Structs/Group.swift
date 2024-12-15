//
//  Group.swift
//  PaperlessAPI
//
//  Created by Leo Wehrfritz on 14.12.24.
//

import Foundation

public struct PaperlessGroup: ListableObject {
    public let id: Int
    let name: String
    let permissions: [Permission]
}
