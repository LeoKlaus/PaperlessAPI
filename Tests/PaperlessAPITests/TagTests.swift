//
//  TagTests.swift
//  PaperlessAPI
//
//  Created by Leo Wehrfritz on 13.12.24.
//

import Testing
import Foundation
@testable import PaperlessAPI

@Test func decodeTag() async throws {
    
    let json = """
{
  "id": 1,
  "slug": "paid",
  "name": "Paid",
  "color": "#52D35F",
  "text_color": "#000000",
  "match": "",
  "matching_algorithm": 1,
  "is_insensitive": true,
  "is_inbox_tag": false,
  "document_count": 8,
  "owner": null,
  "user_can_change": true
}
""".data(using: .utf8)!
    
    
    let decoder = JSONDecoder()
    let tag = try decoder.decode(PaperlessAPI.Tag.self, from: json)
    
    #expect(tag.id == 1)
    #expect(tag.slug == "paid")
    #expect(tag.name == "Paid")
    #expect(tag.color == "#52D35F")
    #expect(tag.textColor == "#000000")
    #expect(tag.match == "")
    #expect(tag.matchingAlgorithm == 1)
    #expect(tag.isInsensitive)
    #expect(!(tag.isInboxTag))
    #expect(tag.documentCount == 8)
    #expect(tag.owner == nil)
    #expect(tag.userCanChange ?? false)
}
