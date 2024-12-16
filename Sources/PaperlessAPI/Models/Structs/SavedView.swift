//
//  SavedView.swift
//  PaperlessAPI
//
//  Created by Leo Wehrfritz on 13.12.24.
//

import Foundation

public struct SavedView: ListableObject, ModifiableObject {
    
    public static func singularEndpoint(_ id: Int) -> ApiEndpoint {
        .savedView(id)
    }
    
    public static var pluralEndpoint: ApiEndpoint = .savedViews
    
    public let id: Int
    public let name: String
    public let showOnDashboard: Bool
    public let showInSidebar: Bool
    public let sortField: String
    public let sortReverse: Bool
    public let filterRules: [FilterRule]
    public let pageSize: Int?
    public let displayMode: DisplayMode?
    public let displayFields: [SavedViewDisplayFields]?
    public let owner: Int?
    public let userCanChange: Bool?
    public let permissions: ObjectPermissions?
    
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
        case permissions
    }
}
