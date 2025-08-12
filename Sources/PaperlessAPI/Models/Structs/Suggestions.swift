//
//  Suggestions.swift
//  PaperlessAPI
//
//  Created by Leo Wehrfritz on 10.01.25.
//


import Foundation

public struct Suggestions: Decodable {
    
    public var correspondents: Set<Int>
    public var tags: Set<Int>
    public var documentTypes: Set<Int>
    public var storagePaths: Set<Int>
    public var dates: Set<Date>
    
    enum CodingKeys: String, CodingKey {
        case correspondents
        case tags
        case documentTypes = "document_types"
        case storagePaths = "storage_paths"
        case dates
    }
    
    public init(correspondents: Set<Int> = [], tags: Set<Int> = [], documentTypes: Set<Int> = [], storagePaths: Set<Int> = [], dates: Set<Date> = []) {
        self.correspondents = correspondents
        self.tags = tags
        self.documentTypes = documentTypes
        self.storagePaths = storagePaths
        self.dates = dates
    }
}
