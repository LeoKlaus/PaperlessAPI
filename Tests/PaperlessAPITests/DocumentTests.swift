//
//  DocumentTests.swift
//  PaperlessAPI
//
//  Created by Leo Wehrfritz on 12.12.24.
//

import Testing
import Foundation
@testable import PaperlessAPI

@Test func decodeDocument() async throws {
    
    let json = """
{
    "id": 23,
    "correspondent": 4,
    "document_type": 2,
    "storage_path": null,
    "title": "Invoice Printer",
    "content": "Lorem ipsum dolor sit amet",
    "tags": [
        2,
        32
    ],
    "created": "2024-10-12T00:00:00+01:00",
    "created_date": "2024-10-12",
    "modified": "2024-10-15T17:53:43.498804+01:00",
    "added": "2024-10-12T16:24:55.687056+01:00",
    "deleted_at": null,
    "archive_serial_number": null,
    "original_file_name": "epson-ecotank-invoice-24-10-12.pdf",
    "archived_file_name": "2024-10-12 Invoice Printer.pdf",
    "owner": 2,
    "user_can_change": true,
    "is_shared_by_requester": false,
    "notes": [
        {
            "id": 16,
            "note": "Test-Note",
            "created": "2023-11-22T11:41:39.380518+01:00",
            "document": 23,
            "user": 2
        }
    ],
    "custom_fields": [
        {
            "value": 0,
            "field": 27
        }
    ]
}
""".data(using: .utf8)!
    
    
    let decoder = JSONDecoder()
    decoder.dateDecodingStrategy = .paperlessDateFormat
    
    let document = try decoder.decode(Document.self, from: json)
    
    #expect(document.id == 23)
    #expect(document.correspondent == 4)
    #expect(document.documentType == 2)
    #expect(document.storagePath == nil)
    #expect(document.title == "Invoice Printer")
    #expect(document.content == "Lorem ipsum dolor sit amet")
    #expect(document.tags == [2, 32])
    #expect(document.created == Date(timeIntervalSince1970: 1728687600))
    #expect(document.createdDate == Date(timeIntervalSince1970: 1728684000))
    #expect(document.modified == Date(timeIntervalSince1970: 1729011223.498))
    #expect(document.added == Date(timeIntervalSince1970: 1728746695.687))
    #expect(document.deletedAt == nil)
    #expect(document.archiveSerialNumber == nil)
    #expect(document.originalFileName == "epson-ecotank-invoice-24-10-12.pdf")
    #expect(document.archivedFileName == "2024-10-12 Invoice Printer.pdf")
    #expect(document.owner == 2)
    #expect(document.userCanChange ?? false)
    #expect(!(document.isSharedByRequester ?? true))
    #expect(document.notes == [
        Note(id: 16, note: "Test-Note", created: Date(timeIntervalSince1970: 1700649699.38), document: 23, user: 2)
    ])
    #expect(document.customFields == [
        CustomFieldContent(value: .number(0), field: 27)
    ])
}


