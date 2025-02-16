//
//  SavedView.swift
//  PaperlessAPI
//
//  Created by Leo Wehrfritz on 13.12.24.
//

import Foundation

public struct SavedView: ListableObject, ModifiableObject, Hashable {
    
    public static func singularEndpoint(_ id: Int) -> ApiEndpoint {
        .savedView(id)
    }
    
    public static var pluralEndpoint: ApiEndpoint = .savedViews
    
    public var id: Int
    public var name: String
    public var showOnDashboard: Bool
    public var showInSidebar: Bool
    public var sortField: SavedViewSortField
    public var sortReverse: Bool
    public let filterRules: [FilterRule]
    public var pageSize: Int?
    public var displayMode: DisplayMode?
    public var displayFields: [SavedViewDisplayField]?
    public var owner: Int?
    public let userCanChange: Bool?
    public var permissions: ObjectPermissions?
    
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
    
    public init(id: Int, name: String, showOnDashboard: Bool, showInSidebar: Bool, sortField: SavedViewSortField, sortReverse: Bool, filterRules: [FilterRule], pageSize: Int?, displayMode: DisplayMode?, displayFields: [SavedViewDisplayField]?, owner: Int?, userCanChange: Bool?, permissions: ObjectPermissions?) {
        self.id = id
        self.name = name
        self.showOnDashboard = showOnDashboard
        self.showInSidebar = showInSidebar
        self.sortField = sortField
        self.sortReverse = sortReverse
        self.filterRules = filterRules
        self.pageSize = pageSize
        self.displayMode = displayMode
        self.displayFields = displayFields
        self.owner = owner
        self.userCanChange = userCanChange
        self.permissions = permissions
    }
    
    enum EncodingKeys: String, CodingKey {
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
        case setPermissions = "set_permissions"
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: EncodingKeys.self)
        try container.encode(name, forKey: .name)
        try container.encode(showOnDashboard, forKey: .showOnDashboard)
        try container.encode(showInSidebar, forKey: .showInSidebar)
        try container.encode(sortField, forKey: .sortField)
        try container.encode(sortReverse, forKey: .sortReverse)
        try container.encode(filterRules, forKey: .filterRules)
        try container.encode(pageSize, forKey: .pageSize)
        try container.encode(displayMode, forKey: .displayMode)
        try container.encode(displayFields, forKey: .displayFields)
        try container.encodeIfPresent(owner, forKey: .owner)
        try container.encodeIfPresent(permissions, forKey: .setPermissions)
    }
}
