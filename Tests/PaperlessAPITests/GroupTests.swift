//
//  File.swift
//  PaperlessAPI
//
//  Created by Leo Wehrfritz on 14.12.24.
//

import Testing
import Foundation
@testable import PaperlessAPI

@Test func decodeGroup() async throws {
    
    let json = """
{
    "id": 2,
    "name": "User",
    "permissions": [
        "add_logentry",
        "change_logentry",
        "delete_logentry",
        "view_logentry",
        "view_user",
        "change_correspondent",
        "delete_correspondent",
        "view_correspondent",
        "delete_document",
        "view_document",
        "view_documenttype",
        "add_note",
        "change_note",
        "add_paperlesstask",
        "add_storagepath",
        "change_storagepath",
        "delete_storagepath",
        "view_storagepath",
        "change_tag",
        "delete_tag",
        "view_tag",
        "delete_uisettings",
        "view_uisettings",
        "add_mailaccount",
        "change_mailaccount",
        "delete_mailaccount",
        "view_mailaccount",
        "add_mailrule",
        "change_mailrule",
        "delete_mailrule"
    ]
}
""".data(using: .utf8)!
    
    
    let decoder = JSONDecoder()
    let group = try decoder.decode(PaperlessGroup.self, from: json)
    
    #expect(group.id == 2)
    #expect(group.name == "User")
    #expect(group.permissions.count == 30)
    group.permissions.forEach { permission in
        if case .unknown = permission {
            Issue.record("Couldn't decode permission: \(permission.rawValue)")
        }
    }
}
