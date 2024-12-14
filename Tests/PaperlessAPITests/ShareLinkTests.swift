//
//  ShareLinkTests.swift
//  PaperlessAPI
//
//  Created by Leo Wehrfritz on 14.12.24.
//

import Testing
import Foundation
@testable import PaperlessAPI

@Test func decodeShareLink() async throws {
    
    let json = """
{
  "id": 24,
  "created": "2024-02-13T15:43:53.732572+01:00",
  "expiration": "2024-02-14T15:43:53+01:00",
  "slug": "EFbIE71Gan4zmE1TjwjtX9g1XDby4qSYIovhfGO82bKeiQRCWS",
  "document": 199,
  "file_version": "archive"
}
""".data(using: .utf8)!
    
    
    let decoder = JSONDecoder()
    decoder.dateDecodingStrategy = .paperlessDateFormat
    let shareLink = try decoder.decode(ShareLink.self, from: json)
    
    #expect(shareLink.id == 24)
    #expect(shareLink.created == Date(timeIntervalSince1970: 1707835433.732))
    #expect(shareLink.expiration == Date(timeIntervalSince1970: 1707921833))
    #expect(shareLink.slug == "EFbIE71Gan4zmE1TjwjtX9g1XDby4qSYIovhfGO82bKeiQRCWS")
    #expect(shareLink.document == 199)
    #expect(shareLink.fileVersion == .archive)
}
