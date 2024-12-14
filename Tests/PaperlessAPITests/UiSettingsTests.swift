//
//  UiSettingsTests.swift
//  PaperlessAPI
//
//  Created by Leo Wehrfritz on 14.12.24.
//

import Testing
import Foundation
import SwiftUI
@testable import PaperlessAPI

@Test func decodeUiSettings() async throws {
    
    let json = """
{
    "user": {
        "id": 3,
        "username": "root",
        "is_staff": true,
        "is_superuser": true,
        "groups": []
    },
    "settings": {
        "update_checking": {
            "enabled": true,
            "backend_setting": "default"
        },
        "tour_complete": true,
        "bulk_edit": {
            "apply_on_close": false,
            "confirmation_dialogs": true
        },
        "documentListSize": 50,
        "slim_sidebar": false,
        "dark_mode": {
            "use_system": true,
            "enabled": "false",
            "thumb_inverted": "true"
        },
        "theme": {
            "color": "#725BFF"
        },
        "document_details": {
            "native_pdf_viewer": false
        },
        "date_display": {
            "date_locale": "",
            "date_format": "mediumDate"
        },
        "notifications": {
            "consumer_new_documents": true,
            "consumer_success": true,
            "consumer_failed": true,
            "consumer_suppress_on_dashboard": true
        },
        "notes_enabled": true,
        "saved_views": {
            "warn_on_unsaved_change": true
        },
        "language": "",
        "app_title": "Paperparrot Demo",
        "app_logo": "/logo/logo.svg",
        "permissions": {
            "default_owner": null,
            "default_view_users": [
                1
            ],
            "default_view_groups": [
                2
            ],
            "default_edit_users": [
                3
            ],
            "default_edit_groups": [
                4
            ]
        },
        "document_editing": {
            "remove_inbox_tags": false
        },
        "auditlog_enabled": true,
        "search": {
            "db_only": false
        },
        "trash_delay": 30
    },
    "permissions": [
        "view_correspondent",
        "add_mailaccount",
        "change_group",
        "add_contenttype",
        "add_tokenproxy",
        "add_token",
        "change_session",
        "delete_socialtoken",
        "view_logentry",
        "change_user",
        "view_token",
        "add_storagepath",
        "delete_savedviewfilterrule",
        "delete_comment",
        "delete_emailconfirmation",
        "change_socialaccount",
        "add_workflow",
        "change_chordcounter",
        "change_customfieldinstance",
        "add_uisettings",
        "view_customfield",
        "change_groupobjectpermission",
        "delete_logentry",
        "add_customfield",
        "delete_tag",
        "view_user",
        "delete_session",
        "delete_customfield",
        "delete_customfieldinstance",
        "add_documenttype",
        "view_logentry",
        "add_taskresult",
        "add_session",
        "add_group",
        "view_contenttype",
        "delete_processedmail",
        "delete_savedview",
        "change_paperlesstask",
        "change_document",
        "view_paperlesstask",
        "add_socialtoken",
        "delete_group",
        "add_emailconfirmation",
        "view_mailaccount",
        "view_tag",
        "delete_workflow",
        "add_processedmail",
        "add_tag",
        "change_savedviewfilterrule",
        "delete_documenttype",
        "delete_uisettings",
        "view_savedviewfilterrule",
        "add_logentry",
        "add_emailaddress",
        "delete_mailaccount",
        "change_userobjectpermission",
        "view_savedview",
        "delete_socialaccount",
        "add_permission",
        "change_socialapp",
        "add_document",
        "change_correspondent",
        "view_tokenproxy",
        "add_workflowaction",
        "view_emailconfirmation",
        "change_savedview",
        "delete_groupresult",
        "change_emailaddress",
        "add_groupresult",
        "view_workflowtrigger",
        "add_savedview",
        "delete_taskresult",
        "change_sharelink",
        "change_storagepath",
        "change_note",
        "delete_correspondent",
        "change_tag",
        "add_mailrule",
        "delete_paperlesstask",
        "view_mailrule",
        "add_sharelink",
        "change_taskresult",
        "delete_permission",
        "view_emailaddress",
        "view_document",
        "add_comment",
        "add_note",
        "change_workflowaction",
        "change_workflowtrigger",
        "delete_user",
        "change_workflow",
        "view_userobjectpermission",
        "add_customfieldinstance",
        "change_tokenproxy",
        "add_correspondent",
        "add_groupobjectpermission",
        "add_savedviewfilterrule",
        "view_storagepath",
        "change_documenttype",
        "add_applicationconfiguration",
        "change_logentry",
        "view_socialaccount",
        "change_uisettings",
        "delete_chordcounter",
        "view_permission",
        "change_applicationconfiguration",
        "change_logentry",
        "delete_userobjectpermission",
        "view_chordcounter",
        "change_customfield",
        "change_emailconfirmation",
        "delete_document",
        "add_userobjectpermission",
        "delete_logentry",
        "change_comment",
        "view_documenttype",
        "delete_log",
        "delete_workflowaction",
        "add_socialapp",
        "change_mailaccount",
        "delete_token",
        "view_applicationconfiguration",
        "delete_groupobjectpermission",
        "change_socialtoken",
        "add_logentry",
        "delete_applicationconfiguration",
        "delete_sharelink",
        "view_group",
        "delete_socialapp",
        "change_groupresult",
        "view_session",
        "change_mailrule",
        "change_processedmail",
        "change_permission",
        "add_socialaccount",
        "delete_note",
        "add_user",
        "view_customfieldinstance",
        "view_sharelink",
        "view_workflowaction",
        "view_processedmail",
        "change_contenttype",
        "add_workflowtrigger",
        "view_workflow",
        "delete_storagepath",
        "change_token",
        "delete_workflowtrigger",
        "add_paperlesstask",
        "add_log",
        "view_log",
        "delete_contenttype",
        "view_socialtoken",
        "view_groupobjectpermission",
        "view_groupresult",
        "delete_tokenproxy",
        "add_chordcounter",
        "view_socialapp",
        "delete_mailrule",
        "view_taskresult",
        "delete_emailaddress",
        "view_note",
        "view_comment",
        "view_uisettings",
        "change_log"
    ]
}
""".data(using: .utf8)!
    
    
    let decoder = JSONDecoder()
    decoder.dateDecodingStrategy = .paperlessDateFormat
    let uiSettings = try decoder.decode(UiSettings.self, from: json)
    
    #expect(uiSettings.user == User(id: 3, username: "root", email: nil, password: nil, firstName: nil, lastName: nil, dateJoined: nil, isStaff: true, isActive: nil, isSuperuser: true, groups: [], userPermissions: nil, inheritedPermissions: nil))
    
    #expect(uiSettings.settings.updateChecking.enabled)
    #expect(uiSettings.settings.updateChecking.backendSetting == "default")
    
    #expect(uiSettings.settings.tourComplete)
    
    #expect(!uiSettings.settings.bulkEdit.applyOnClose)
    #expect(uiSettings.settings.bulkEdit.confirmationDialogs)
    
    #expect(uiSettings.settings.documentListSize == 50)
    
    #expect(!uiSettings.settings.slimSidebar)
    
    #expect(uiSettings.settings.darkMode.useSystem)
    #expect(!uiSettings.settings.darkMode.enabled)
    #expect(uiSettings.settings.darkMode.thumbInverted)
    
    #expect(uiSettings.settings.theme.color == Color(hex: "#725BFF"))
    
    #expect(!uiSettings.settings.documentDetails.nativePdfViewer)
    
    #expect(uiSettings.settings.dateDisplay.dateLocale == "")
    #expect(uiSettings.settings.dateDisplay.dateFormat == "mediumDate")
    
    #expect(uiSettings.settings.notifications.consumerNewDocuments)
    #expect(uiSettings.settings.notifications.consumerSuccess)
    #expect(uiSettings.settings.notifications.consumerFailed)
    #expect(uiSettings.settings.notifications.consumerSuppressOnDashboard)
    
    #expect(uiSettings.settings.notesEnabled)
    
    #expect(uiSettings.settings.savedViews.warnOnUnsavedChange)
    
    #expect(uiSettings.settings.language == "")
    
    #expect(uiSettings.settings.appTitle == "Paperparrot Demo")
    #expect(uiSettings.settings.appLogo == "/logo/logo.svg")
    
    #expect(uiSettings.settings.permissions.defaultOwner == nil)
    #expect(uiSettings.settings.permissions.defaultViewUsers == [1])
    #expect(uiSettings.settings.permissions.defaultViewGroups == [2])
    #expect(uiSettings.settings.permissions.defaultEditUsers == [3])
    #expect(uiSettings.settings.permissions.defaultEditGroups == [4])
    
    #expect(!uiSettings.settings.documentEditing.removeInboxTags)
    
    #expect(uiSettings.settings.auditlogEnabled)
    
    #expect(!uiSettings.settings.search.dbOnly)
    
    #expect(uiSettings.settings.trashDelay == 30)
    
    
    #expect(uiSettings.permissions.count == 164)
    uiSettings.permissions.forEach { permission in
        if case .unknown(let string) = permission {
            Issue.record("Unknown permission: \(string)")
        }
    }
}
