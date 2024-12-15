//
//  PaginatedList.swift
//  PaperlessAPI
//
//  Created by Leo Wehrfritz on 14.12.24.
//

import Foundation

public protocol PaginatedList: Codable {
    var count: Int { get }
    var next: URL? { get }
    var previous: URL? { get }
    var all: [Int] { get }
    var results: [PaperlessObject] { get }
}
