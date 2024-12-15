//
//  PaginatedList.swift
//  PaperlessAPI
//
//  Created by Leo Wehrfritz on 14.12.24.
//

import Foundation

public struct PaginatedList<T: PaperlessObject>: Codable {
    public let count: Int
    public let next: URL?
    public let previous: URL?
    public let all: [Int]
    public let results: [T]
}
