//
//  PaginatedList.swift
//  PaperlessAPI
//
//  Created by Leo Wehrfritz on 14.12.24.
//

import Foundation

public struct PaginatedList<T: PaperlessObject>: Codable {
    let count: Int
    let next: URL?
    let previous: URL?
    let all: [Int]
    let results: [T]
}
