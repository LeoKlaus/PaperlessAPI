//
//  Settings.swift
//  PaperlessAPI
//
//  Created by Leo Wehrfritz on 14.12.24.
//

import SwiftUI

public struct Settings: Codable, Sendable {
    public let updateChecking: UpdateCheckingSettings
    public let tourComplete: Bool?
    public let bulkEdit: BulkEditSettings?
    public let documentListSize: Int?
    public let slimSidebar: Bool?
    public let darkMode: DarkModeSettings?
    public let theme: ThemeSettings?
    public let documentDetails: DocumentDetailSettings?
    public let dateDisplay: DateDisplaySettings?
    public let notifications: NotificationSettings?
    public let notesEnabled: Bool?
    public let savedViews: SavedViewSettings?
    public let language: String?
    public let version: String?
    public let appTitle: String?
    public let appLogo: String?
    public let permissions: PermissionSettings?
    public let documentEditing: DocumentEditingSettings?
    public let auditlogEnabled: Bool
    public let search: SearchSettings?
    public let trashDelay: Int
    
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
        case version
        case appTitle = "app_title"
        case appLogo = "app_logo"
        case permissions
        case documentEditing = "document_editing"
        case auditlogEnabled = "auditlog_enabled"
        case search
        case trashDelay = "trash_delay"
    }
    
    public init(updateChecking: UpdateCheckingSettings, tourComplete: Bool?, bulkEdit: BulkEditSettings?, documentListSize: Int?, slimSidebar: Bool?, darkMode: DarkModeSettings?, theme: ThemeSettings?, documentDetails: DocumentDetailSettings?, dateDisplay: DateDisplaySettings?, notifications: NotificationSettings?, notesEnabled: Bool?, savedViews: SavedViewSettings?, language: String?, version: String?, appTitle: String?, appLogo: String?, permissions: PermissionSettings?, documentEditing: DocumentEditingSettings?, auditlogEnabled: Bool, search: SearchSettings?, trashDelay: Int) {
        self.updateChecking = updateChecking
        self.tourComplete = tourComplete
        self.bulkEdit = bulkEdit
        self.documentListSize = documentListSize
        self.slimSidebar = slimSidebar
        self.darkMode = darkMode
        self.theme = theme
        self.documentDetails = documentDetails
        self.dateDisplay = dateDisplay
        self.notifications = notifications
        self.notesEnabled = notesEnabled
        self.savedViews = savedViews
        self.language = language
        self.version = version
        self.appTitle = appTitle
        self.appLogo = appLogo
        self.permissions = permissions
        self.documentEditing = documentEditing
        self.auditlogEnabled = auditlogEnabled
        self.search = search
        self.trashDelay = trashDelay
    }
}

public struct UpdateCheckingSettings: Codable, Sendable {
    public let enabled: Bool?
    public let backendSetting: String
    
    enum CodingKeys: String, CodingKey {
        case enabled
        case backendSetting = "backend_setting"
    }
    
    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.enabled = try container.decodeIfPresent(Bool.self, forKey: .enabled)
        do {
            self.backendSetting = try container.decode(String.self, forKey: .backendSetting)
        } catch DecodingError.typeMismatch {
            let boolValue = try container.decode(Bool.self, forKey: .backendSetting)
            self.backendSetting = String(boolValue)
        }
    }
    
    public init(enabled: Bool, backendSetting: String) {
        self.enabled = enabled
        self.backendSetting = backendSetting
    }
}

public struct BulkEditSettings: Codable, Sendable {
    public let applyOnClose: Bool
    public let confirmationDialogs: Bool
    
    enum CodingKeys: String, CodingKey {
        case applyOnClose = "apply_on_close"
        case confirmationDialogs = "confirmation_dialogs"
    }
    
    public init(applyOnClose: Bool, confirmationDialogs: Bool) {
        self.applyOnClose = applyOnClose
        self.confirmationDialogs = confirmationDialogs
    }
    
    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        do {
            self.applyOnClose = try container.decode(Bool.self, forKey: .applyOnClose)
        } catch DecodingError.typeMismatch(_, _) {
            let applyOnCloseString = try container.decode(String.self, forKey: .applyOnClose)
            self.applyOnClose = applyOnCloseString == "true" ? true : false
        }
        do {
            self.confirmationDialogs = try container.decode(Bool.self, forKey: .confirmationDialogs)
        } catch DecodingError.typeMismatch(_, _) {
            let confirmationDialogsString = try container.decode(String.self, forKey: .confirmationDialogs)
            self.confirmationDialogs = confirmationDialogsString == "true" ? true : false
        }
    }
}

public struct DarkModeSettings: Codable, Sendable {
    public let useSystem: Bool
    public let enabled: Bool
    public let thumbInverted: Bool
    
    enum CodingKeys: String, CodingKey {
        case useSystem = "use_system"
        case enabled
        case thumbInverted = "thumb_inverted"
    }
    
    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.useSystem = try container.decode(Bool.self, forKey: .useSystem)
        do {
            self.enabled = try container.decode(Bool.self, forKey: .enabled)
        } catch DecodingError.typeMismatch(_, _) {
            let enabledStr = try container.decode(String.self, forKey: .enabled)
            self.enabled = enabledStr == "true" ? true : false
        }
        let thumbInvertedStr = try container.decode(String.self, forKey: .thumbInverted)
        self.thumbInverted = thumbInvertedStr == "true" ? true : false
    }
    
    public func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(useSystem, forKey: .useSystem)
        try container.encode(enabled ? "true" : "false", forKey: .enabled)
        try container.encode(thumbInverted ? "true" : "false", forKey: .thumbInverted)
    }
    
    public init(useSystem: Bool, enabled: Bool, thumbInverted: Bool) {
        self.useSystem = useSystem
        self.enabled = enabled
        self.thumbInverted = thumbInverted
    }
}

public struct ThemeSettings: Codable, Sendable {
    public let color: String?
    
    public init(color: String?) {
        self.color = color
    }
}

public struct DocumentDetailSettings: Codable, Sendable {
    public let nativePdfViewer: Bool
    
    enum CodingKeys: String, CodingKey {
        case nativePdfViewer = "native_pdf_viewer"
    }
    
    public init(nativePdfViewer: Bool) {
        self.nativePdfViewer = nativePdfViewer
    }
}

public struct DateDisplaySettings: Codable, Sendable {
    public let dateLocale: String
    public let dateFormat: String
    
    enum CodingKeys: String, CodingKey {
        case dateLocale = "date_locale"
        case dateFormat = "date_format"
    }
    
    public init(dateLocale: String, dateFormat: String) {
        self.dateLocale = dateLocale
        self.dateFormat = dateFormat
    }
}

public struct NotificationSettings: Codable, Sendable {
    public let consumerNewDocuments: Bool
    public let consumerSuccess: Bool
    public let consumerFailed: Bool
    public let consumerSuppressOnDashboard: Bool
    
    enum CodingKeys: String, CodingKey {
        case consumerNewDocuments = "consumer_new_documents"
        case consumerSuccess = "consumer_success"
        case consumerFailed = "consumer_failed"
        case consumerSuppressOnDashboard = "consumer_suppress_on_dashboard"
    }
    
    public init(consumerNewDocuments: Bool, consumerSuccess: Bool, consumerFailed: Bool, consumerSuppressOnDashboard: Bool) {
        self.consumerNewDocuments = consumerNewDocuments
        self.consumerSuccess = consumerSuccess
        self.consumerFailed = consumerFailed
        self.consumerSuppressOnDashboard = consumerSuppressOnDashboard
    }
}

public struct SavedViewSettings: Codable, Sendable {
    public let warnOnUnsavedChange: Bool?
    
    enum CodingKeys: String, CodingKey {
        case warnOnUnsavedChange = "warn_on_unsaved_change"
    }
    
    public init(warnOnUnsavedChange: Bool?) {
        self.warnOnUnsavedChange = warnOnUnsavedChange
    }
}

public struct PermissionSettings: Codable, Sendable {
    public let defaultOwner: Int?
    public var defaultViewUsers: [Int] = []
    public var defaultViewGroups: [Int] = []
    public var defaultEditUsers: [Int] = []
    public var defaultEditGroups: [Int] = []
    
    enum CodingKeys: String, CodingKey {
        case defaultOwner = "default_owner"
        case defaultViewUsers = "default_view_users"
        case defaultViewGroups = "default_view_groups"
        case defaultEditUsers = "default_edit_users"
        case defaultEditGroups = "default_edit_groups"
    }
    
    public init(defaultOwner: Int?, defaultViewUsers: [Int], defaultViewGroups: [Int], defaultEditUsers: [Int], defaultEditGroups: [Int]) {
        self.defaultOwner = defaultOwner
        self.defaultViewUsers = defaultViewUsers
        self.defaultViewGroups = defaultViewGroups
        self.defaultEditUsers = defaultEditUsers
        self.defaultEditGroups = defaultEditGroups
    }
}

public struct DocumentEditingSettings: Codable, Sendable {
    public let removeInboxTags: Bool
    
    enum CodingKeys: String, CodingKey {
        case removeInboxTags = "remove_inbox_tags"
    }
    
    public init(removeInboxTags: Bool) {
        self.removeInboxTags = removeInboxTags
    }
}

public struct SearchSettings: Codable, Sendable {
    public let dbOnly: Bool
    
    enum CodingKeys: String, CodingKey {
        case dbOnly = "db_only"
    }
    
    public init(dbOnly: Bool) {
        self.dbOnly = dbOnly
    }
}
