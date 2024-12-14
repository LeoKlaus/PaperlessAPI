//
//  Settings.swift
//  PaperlessAPI
//
//  Created by Leo Wehrfritz on 14.12.24.
//

import SwiftUI

struct Settings: Codable {
    let updateChecking: UpdateCheckingSettings
    let tourComplete: Bool
    let bulkEdit: BulkEditSettings
    let documentListSize: Int
    let slimSidebar: Bool
    let darkMode: DarkModeSettings
    let theme: ThemeSettings
    let documentDetails: DocumentDetailSettings
    let dateDisplay: DateDisplaySettings
    let notifications: NotificationSettings
    let notesEnabled: Bool
    let savedViews: SavedViewSettings
    let language: String
    let appTitle: String
    let appLogo: String
    let permissions: PermissionSettings
    let documentEditing: DocumentEditingSettings
    let auditlogEnabled: Bool
    let search: SearchSettings
    let trashDelay: Int
    
    enum CodingKeys: String, CodingKey {
        case updateChecking = "update_checking"
        case tourComplete = "tour_complete"
        case bulkEdit = "bulk_edit"
        case documentListSize
        case slimSidebar = "slim_sidebar"
        case darkMode = "dark_mode"
        case theme
        case documentDetails = "document_details"
        case dateDisplay = "date_display"
        case notifications
        case notesEnabled = "notes_enabled"
        case savedViews = "saved_views"
        case language
        case appTitle = "app_title"
        case appLogo = "app_logo"
        case permissions
        case documentEditing = "document_editing"
        case auditlogEnabled = "auditlog_enabled"
        case search
        case trashDelay = "trash_delay"
    }
}

struct UpdateCheckingSettings: Codable {
    let enabled: Bool
    let backendSetting: String
    
    enum CodingKeys: String, CodingKey {
        case enabled
        case backendSetting = "backend_setting"
    }
}

struct BulkEditSettings: Codable {
    let applyOnClose: Bool
    let confirmationDialogs: Bool
    
    enum CodingKeys: String, CodingKey {
        case applyOnClose = "apply_on_close"
        case confirmationDialogs = "confirmation_dialogs"
    }
}

struct DarkModeSettings: Codable {
    let useSystem: Bool
    let enabled: Bool
    let thumbInverted: Bool
    
    enum CodingKeys: String, CodingKey {
        case useSystem = "use_system"
        case enabled
        case thumbInverted = "thumb_inverted"
    }
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.useSystem = try container.decode(Bool.self, forKey: .useSystem)
        let enabledStr = try container.decode(String.self, forKey: .enabled)
        self.enabled = enabledStr == "true" ? true : false
        let thumbInvertedStr = try container.decode(String.self, forKey: .thumbInverted)
        self.thumbInverted = thumbInvertedStr == "true" ? true : false
    }
    
    func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(useSystem, forKey: .useSystem)
        try container.encode(enabled ? "true" : "false", forKey: .enabled)
        try container.encode(thumbInverted ? "true" : "false", forKey: .thumbInverted)
    }
}

struct ThemeSettings: Codable {
    let color: Color
}

struct DocumentDetailSettings: Codable {
    let nativePdfViewer: Bool
    
    enum CodingKeys: String, CodingKey {
        case nativePdfViewer = "native_pdf_viewer"
    }
}

struct DateDisplaySettings: Codable {
    let dateLocale: String
    let dateFormat: String
    
    enum CodingKeys: String, CodingKey {
        case dateLocale = "date_locale"
        case dateFormat = "date_format"
    }
}

struct NotificationSettings: Codable {
    let consumerNewDocuments: Bool
    let consumerSuccess: Bool
    let consumerFailed: Bool
    let consumerSuppressOnDashboard: Bool
    
    enum CodingKeys: String, CodingKey {
        case consumerNewDocuments = "consumer_new_documents"
        case consumerSuccess = "consumer_success"
        case consumerFailed = "consumer_failed"
        case consumerSuppressOnDashboard = "consumer_suppress_on_dashboard"
    }
}

struct SavedViewSettings: Codable {
    let warnOnUnsavedChange: Bool
    
    enum CodingKeys: String, CodingKey {
        case warnOnUnsavedChange = "warn_on_unsaved_change"
    }
}

struct PermissionSettings: Codable {
    let defaultOwner: Int?
    let defaultViewUsers: [Int]
    let defaultViewGroups: [Int]
    let defaultEditUsers: [Int]
    let defaultEditGroups: [Int]
    
    enum CodingKeys: String, CodingKey {
        case defaultOwner = "default_owner"
        case defaultViewUsers = "default_view_users"
        case defaultViewGroups = "default_view_groups"
        case defaultEditUsers = "default_edit_users"
        case defaultEditGroups = "default_edit_groups"
    }
}

struct DocumentEditingSettings: Codable {
    let removeInboxTags: Bool
    
    enum CodingKeys: String, CodingKey {
        case removeInboxTags = "remove_inbox_tags"
    }
}

struct SearchSettings: Codable {
    let dbOnly: Bool
    
    enum CodingKeys: String, CodingKey {
        case dbOnly = "db_only"
    }
}
