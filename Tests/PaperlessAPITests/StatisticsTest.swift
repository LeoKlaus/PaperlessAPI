//
//  StatisticsTest.swift
//  PaperlessAPI
//
//  Created by Leo Wehrfritz on 14.12.24.
//

import Testing
import Foundation
@testable import PaperlessAPI

@Test func decodeStatistics() async throws {
    
    let json = """
{
    "documents_total": 31,
    "documents_inbox": 7,
    "inbox_tag": 2,
    "inbox_tags": [
        2,
        32
    ],
    "document_file_type_counts": [
        {
            "mime_type": "application/pdf",
            "mime_type_count": 24
        },
        {
            "mime_type": "image/png",
            "mime_type_count": 3
        },
        {
            "mime_type": "application/vnd.openxmlformats-officedocument.wordprocessingml.document",
            "mime_type_count": 2
        },
        {
            "mime_type": "message/rfc822",
            "mime_type_count": 1
        },
        {
            "mime_type": "image/jpeg",
            "mime_type_count": 1
        }
    ],
    "character_count": 157368,
    "tag_count": 28,
    "correspondent_count": 10,
    "document_type_count": 8,
    "storage_path_count": 1,
    "current_asn": 4
}
""".data(using: .utf8)!
    
    
    let decoder = JSONDecoder()
    let statistics = try decoder.decode(Statistics.self, from: json)
    
    #expect(statistics.documentsTotal == 31)
    #expect(statistics.documentsInbox == 7)
    #expect(statistics.inboxTag == 2)
    #expect(statistics.inboxTags == [2, 32])
    #expect(statistics.documentFileTypeCounts == [
        DocumentFileTypeCounts(mimeType: "application/pdf", mimeTypeCount: 24),
        DocumentFileTypeCounts(mimeType: "image/png", mimeTypeCount: 3),
        DocumentFileTypeCounts(mimeType: "application/vnd.openxmlformats-officedocument.wordprocessingml.document", mimeTypeCount: 2),
        DocumentFileTypeCounts(mimeType: "message/rfc822", mimeTypeCount: 1),
        DocumentFileTypeCounts(mimeType: "image/jpeg", mimeTypeCount: 1)
    ])
    #expect(statistics.characterCount == 157368)
    #expect(statistics.tagCount == 28)
    #expect(statistics.correspondentCount == 10)
    #expect(statistics.documentTypeCount == 8)
    #expect(statistics.storagePathCount == 1)
    #expect(statistics.currentAsn == 4)
}
