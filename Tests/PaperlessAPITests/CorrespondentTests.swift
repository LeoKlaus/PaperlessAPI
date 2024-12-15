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
    #expect(correspondent.matchingAlgorithm == .matchAny)
    #expect(correspondent.isInsensitive)
    #expect(correspondent.documentCount == 2)
    #expect(correspondent.owner == 3)
    #expect(correspondent.userCanChange ?? false)
}

@Test func decodeCorrespondentWithPermissions() async throws {
    
    let json = """
{
    "id": 2,
    "slug": "tax-office",
    "name": "Tax Office",
    "match": "tax, payroll, salary, payslip",
    "matching_algorithm": 1,
    "is_insensitive": true,
    "document_count": 5,
    "last_correspondence": "2023-02-01T00:00:00+01:00",
    "owner": null,
    "permissions": {
        "view": {
        "users": [1],
        "groups": [2]
        },
        "change": {
        "users": [3],
        "groups": [4]
        }
    }
}
""".data(using: .utf8)!
    
    
    let decoder = JSONDecoder()
    let correspondent = try decoder.decode(Correspondent.self, from: json)
    
    #expect(correspondent.id == 2)
    #expect(correspondent.slug == "tax-office")
    #expect(correspondent.name == "Tax Office")
    #expect(correspondent.match == "tax, payroll, salary, payslip")
    #expect(correspondent.matchingAlgorithm == .matchAny)
    #expect(correspondent.isInsensitive)
    #expect(correspondent.documentCount == 5)
    #expect(correspondent.owner == nil)
    #expect(correspondent.permissions?.view.users == [1])
    #expect(correspondent.permissions?.view.groups == [2])
    #expect(correspondent.permissions?.change.users == [3])
    #expect(correspondent.permissions?.change.groups == [4])
}
