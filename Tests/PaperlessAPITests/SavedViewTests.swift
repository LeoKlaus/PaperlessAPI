//
//  File.swift
//  PaperlessAPI
//
//  Created by Leo Wehrfritz on 13.12.24.
//

import Testing
import Foundation
@testable import PaperlessAPI

@Test func decodeSavedView() async throws {
    
    let json = """
{
    "id": 62,
    "name": "New",
    "show_on_dashboard": false,
    "show_in_sidebar": false,
    "sort_field": "created",
    "sort_reverse": true,
    "filter_rules": [
        {
            "rule_type": 6,
            "value": "9"
        },
        {
            "rule_type": 40,
            "value": "22"
        }
    ],
    "page_size": 5,
    "display_mode": "smallCards",
    "display_fields": [
        "title",
        "created",
        "tag",
        "correspondent",
        "custom_field_27"
    ],
    "owner": 3,
    "user_can_change": true
}

""".data(using: .utf8)!
    
    
    let decoder = JSONDecoder()
    let savedView = try decoder.decode(SavedView.self, from: json)
    
    #expect(savedView.id == 62)
    #expect(savedView.name == "New")
    #expect(!(savedView.showOnDashboard))
    #expect(!(savedView.showInSidebar))
    #expect(savedView.sortField == .created)
    #expect(savedView.sortReverse)
    #expect(savedView.filterRules == [
        FilterRule(ruleType: .hasTag, value: "9"),
        FilterRule(ruleType: .doesNotHaveCustomFieldIn, value: "22")
    ])
    #expect(savedView.pageSize == 5)
    #expect(savedView.displayMode == .smallCards)
    #expect(savedView.displayFields == [
        .title,
        .created,
        .tags,
        .correspondent,
        .customField(27)
    ])
    #expect(savedView.owner == 3)
    #expect(savedView.userCanChange ?? false)
}
