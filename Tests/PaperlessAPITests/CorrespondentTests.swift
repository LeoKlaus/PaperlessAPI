//
//  CorrespondentTests.swift
//  PaperlessAPI
//
//  Created by Leo Wehrfritz on 12.12.24.
//


import Testing
import Foundation
@testable import PaperlessAPI

@Test func decodeCorrespondent() async throws {
    
    let json = """
{
    "id": 4,
    "slug": "exciting-graphix-gmbh",
    "name": "Exciting Graphix GmbH",
    "match": "exciting, graphix, exiting graphix gmbh",
    "matching_algorithm": 1,
    "is_insensitive": true,
    "document_count": 2,
    "owner": 3,
    "user_can_change": true
}
""".data(using: .utf8)!
    
    
    let decoder = JSONDecoder()
    let correspondent = try decoder.decode(Correspondent.self, from: json)
    
    #expect(correspondent.id == 4)
    #expect(correspondent.slug == "exciting-graphix-gmbh")
    #expect(correspondent.name == "Exciting Graphix GmbH")
    #expect(correspondent.match == "exciting, graphix, exiting graphix gmbh")
    #expect(correspondent.matchingAlgorithm == 1)
    #expect(correspondent.isInsensitive)
    #expect(correspondent.documentCount == 2)
    #expect(correspondent.owner == 3)
    #expect(correspondent.userCanChange ?? false)
}
