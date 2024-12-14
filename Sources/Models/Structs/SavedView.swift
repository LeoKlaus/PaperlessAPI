//
//  SavedView.swift
//  PaperlessAPI
//
//  Created by Leo Wehrfritz on 13.12.24.
//

import Foundation

struct SavedView: PaperlessObject {
    let id: Int
    let name: String
    let showOnDashboard: Bool
    let showInSidebar: Bool
    let sortField: String
    let sortReverse: Bool
    let filterRules: [FilterRule]
    let pageSize: Int?
    let displayMode: DisplayMode?
    let displayFields: [String]?
    let owner: Int?
    let userCanChange: Bool?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case showOnDashboard = "show_on_dashboard"
        case showInSidebar = "show_in_sidebar"
        case sortField = "sort_field"
        case sortReverse = "sort_reverse"
        case filterRules = "filter_rules"
        case pageSize = "page_size"
        case displayMode = "display_mode"
        case displayFields = "display_fields"
        case owner
        case userCanChange = "user_can_change"
    }
}
