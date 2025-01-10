//
//  SuggestionsTests.swift
//  PaperlessAPI
//
//  Created by Leo Wehrfritz on 10.01.25.
//

import Testing
import Foundation
@testable import PaperlessAPI

@Test func decodeSuggestions() async throws {
    
    let json = """
{
  "correspondents": [1],
  "tags": [5, 3],
  "document_types": [4],
  "storage_paths": [],
  "dates": ["2024-12-13"]
}
""".data(using: .utf8)!
    
    
    let decoder = JSONDecoder()
    decoder.dateDecodingStrategy = .paperlessDateDecodingStrategy
    let suggestions = try decoder.decode(Suggestions.self, from: json)
    
    #expect(suggestions.correspondents == [1])
    #expect(suggestions.tags == [5, 3])
    #expect(suggestions.documentTypes == [4])
    #expect(suggestions.storagePaths == [])
    #expect(suggestions.dates == [Date(timeIntervalSince1970: 1734044400)])
}
