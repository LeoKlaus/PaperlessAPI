//
//  Suggestions.swift
//  PaperlessAPI
//
//  Created by Leo Wehrfritz on 10.01.25.
//


import Foundation

public struct Suggestions: Decodable {
    
    public var correspondents: [Int]
    public var tags: [Int]
    public var documentTypes: [Int]
    public var storagePaths: [Int]
    public var dates: [Date]
    
    enum CodingKeys: String, CodingKey {
        case correspondents
        case tags
        case documentTypes = "document_types"
        case storagePaths = "storage_paths"
        case dates
    }
    
    public init(correspondents: [Int] = [], tags: [Int] = [], documentTypes: [Int] = [], storagePaths: [Int] = [], dates: [Date] = []) {
        self.correspondents = correspondents
        self.tags = tags
        self.documentTypes = documentTypes
        self.storagePaths = storagePaths
        self.dates = dates
    }
}
