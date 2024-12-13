//
//  StoragePathTests.swift
//  PaperlessAPI
//
//  Created by Leo Wehrfritz on 13.12.24.
//

import Testing
import Foundation
@testable import PaperlessAPI

@Test func decodeStoragePath() async throws {
    
    let json = """
{
  "id": 7,
  "slug": "test",
  "name": "Test",
  "path": "/",
  "match": "",
  "matching_algorithm": 6,
  "is_insensitive": true,
  "document_count": 3,
  "owner": 2,
  "user_can_change": true
}
""".data(using: .utf8)!
    
    
    let decoder = JSONDecoder()
    let storagePath = try decoder.decode(StoragePath.self, from: json)
    
    #expect(storagePath.id == 7)
    #expect(storagePath.slug == "test")
    #expect(storagePath.name == "Test")
    #expect(storagePath.path == "/")
    #expect(storagePath.match == "")
    #expect(storagePath.matchingAlgorithm == .matchAuto)
    #expect(storagePath.isInsensitive)
    #expect(storagePath.documentCount == 3)
    #expect(storagePath.owner == 2)
    #expect(storagePath.userCanChange ?? false)
}
