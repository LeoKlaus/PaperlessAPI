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

@Test func decodeDocumentTypeWithPermissions() async throws {
    
    let json = """
{
  "id": 1,
  "slug": "invoice",
  "name": "Invoice",
  "match": "",
  "matching_algorithm": 1,
  "is_insensitive": true,
  "document_count": 5,
  "owner": null,
  "permissions": {
    "view": {
      "users": [],
      "groups": []
    },
    "change": {
      "users": [],
      "groups": []
    }
  }
}
""".data(using: .utf8)!
    
    
    let decoder = JSONDecoder()
    let documentType = try decoder.decode(DocumentType.self, from: json)
    
    #expect(documentType.id == 1)
    #expect(documentType.slug == "invoice")
    #expect(documentType.name == "Invoice")
    #expect(documentType.match == "")
    #expect(documentType.matchingAlgorithm == .matchAny)
    #expect(documentType.isInsensitive)
    #expect(documentType.documentCount == 5)
    #expect(documentType.owner == nil)
    #expect(documentType.permissions?.view.users == [])
    #expect(documentType.permissions?.view.groups == [])
    #expect(documentType.permissions?.change.users == [])
    #expect(documentType.permissions?.change.groups == [])
}
