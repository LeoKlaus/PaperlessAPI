//
//  DocumentTypeTests.swift
//  PaperlessAPI
//
//  Created by Leo Wehrfritz on 12.12.24.
//

import Testing
import Foundation
@testable import PaperlessAPI

@Test func decodeDocumentType() async throws {
    
    let json = """
{
  "id": 3,
  "slug": "tax-form",
  "name": "Tax Form",
  "match": "tax form, tax, taxes",
  "matching_algorithm": 2,
  "is_insensitive": true,
  "document_count": 2,
  "owner": 3,
  "user_can_change": true
}
""".data(using: .utf8)!
    
    
    let decoder = JSONDecoder()
    let documentType = try decoder.decode(DocumentType.self, from: json)
    
    #expect(documentType.id == 3)
    #expect(documentType.slug == "tax-form")
    #expect(documentType.name == "Tax Form")
    #expect(documentType.match == "tax form, tax, taxes")
    #expect(documentType.matchingAlgorithm == .matchAll)
    #expect(documentType.isInsensitive)
    #expect(documentType.documentCount == 2)
    #expect(documentType.owner == 3)
    #expect(documentType.userCanChange ?? false)
}
