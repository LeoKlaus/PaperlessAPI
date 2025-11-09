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
    let uiSettings = try decoder.decode(UiSettings.self, from: json)
    
    #expect(uiSettings.user == User(id: 3, username: "root", email: nil, password: nil, firstName: nil, lastName: nil, dateJoined: nil, isStaff: true, isActive: nil, isSuperuser: true, groups: [], userPermissions: nil, inheritedPermissions: nil))
    
    #expect(uiSettings.settings.updateChecking.enabled ?? false)
    #expect(uiSettings.settings.updateChecking.backendSetting == "default")
    
    #expect(uiSettings.settings.tourComplete ?? false)
    
    #expect(!(uiSettings.settings.bulkEdit?.applyOnClose ?? true))
    #expect(uiSettings.settings.bulkEdit?.confirmationDialogs ?? false)
    
    #expect(uiSettings.settings.documentListSize == 50)
    
    #expect(!(uiSettings.settings.slimSidebar ?? true))
    
    #expect(uiSettings.settings.darkMode?.useSystem ?? false)
    #expect(!(uiSettings.settings.darkMode?.enabled ?? true))
    #expect(uiSettings.settings.darkMode?.thumbInverted ?? false)
    
    #expect(uiSettings.settings.theme?.color == "#725BFF")
    
    #expect(!(uiSettings.settings.documentDetails?.nativePdfViewer ?? true))
    
    #expect(uiSettings.settings.dateDisplay?.dateLocale == "")
    #expect(uiSettings.settings.dateDisplay?.dateFormat == "mediumDate")
    
    #expect(uiSettings.settings.notifications?.consumerNewDocuments ?? false)
    #expect(uiSettings.settings.notifications?.consumerSuccess ?? false)
    #expect(uiSettings.settings.notifications?.consumerFailed ?? false)
    #expect(uiSettings.settings.notifications?.consumerSuppressOnDashboard ?? false)
    
    #expect(uiSettings.settings.notesEnabled ?? false)
    
    #expect(uiSettings.settings.savedViews?.warnOnUnsavedChange ?? false)
    
    #expect(uiSettings.settings.language == "")
    
    #expect(uiSettings.settings.appTitle == "Paperparrot Demo")
    #expect(uiSettings.settings.appLogo == "/logo/logo.svg")
    
    #expect(uiSettings.settings.permissions?.defaultOwner == nil)
    #expect(uiSettings.settings.permissions?.defaultViewUsers == [1])
    #expect(uiSettings.settings.permissions?.defaultViewGroups == [2])
    #expect(uiSettings.settings.permissions?.defaultEditUsers == [3])
    #expect(uiSettings.settings.permissions?.defaultEditGroups == [4])
    
    #expect(!(uiSettings.settings.documentEditing?.removeInboxTags ?? true))
    
    #expect(uiSettings.settings.auditlogEnabled)
    
    #expect(!(uiSettings.settings.search?.dbOnly ?? true))
    
    #expect(uiSettings.settings.trashDelay == 30)
    
    
    #expect(uiSettings.permissions.count == 164)
    uiSettings.permissions.forEach { permission in
        if case .unknown(let string) = permission {
            Issue.record("Unknown permission: \(string)")
        }
    }
}

@Test func decodeUiSettingsEdgeCase() async throws {
    
    let json = """
{
    "user": {
        "id": 2,
        "username": "Demo",
        "is_staff": true,
        "is_superuser": true,
        "groups": [
            1
        ],
        "first_name": "Demo",
        "last_name": "User"
    },
    "settings": {
        "theme": {
            "color": "#65bf40"
        },
        "search": {
            "db_only": false,
            "more_link": "title-content"
        },
        "version": "2.18.4",
        "app_logo": null,
        "language": "",
        "app_title": null,
        "bulk_edit": {
            "apply_on_close": "false",
            "confirmation_dialogs": true
        },
        "dark_mode": {
            "enabled": false,
            "use_system": true,
            "thumb_inverted": "true"
        },
        "permissions": {
            "default_owner": 2,
            "default_edit_users": [],
            "default_view_users": [],
            "default_edit_groups": [],
            "default_view_groups": []
        },
        "saved_views": {
            "warn_on_unsaved_change": true,
            "sidebar_views_show_count": true
        },
        "trash_delay": 30,
        "date_display": {
            "date_format": "mediumDate",
            "date_locale": ""
        },
        "slim_sidebar": false,
        "email_enabled": false,
        "notes_enabled": true,
        "notifications": {
            "consumer_failed": true,
            "consumer_success": true,
            "consumer_new_documents": true,
            "consumer_suppress_on_dashboard": false
        },
        "tour_complete": true,
        "update_checking": {
            "enabled": true,
            "backend_setting": true
        },
        "auditlog_enabled": true,
        "documentListSize": 50,
        "document_details": {
            "native_pdf_viewer": false,
            "pdf_viewer_zoom_setting": "page-width"
        },
        "document_editing": {
            "overlay_thumbnail": true,
            "remove_inbox_tags": false
        }
    },
    "permissions": [
        "view_paperlesstask",
        "change_socialaccount",
        "change_groupobjectpermission",
        "change_group",
        "delete_documenttype",
        "view_workflowrun",
        "change_correspondent",
        "add_emailconfirmation",
        "delete_storagepath",
        "view_emailaddress",
        "view_workflowactionemail",
        "delete_document",
        "change_storagepath",
        "view_tag",
        "change_contenttype",
        "change_session",
        "change_token",
        "add_savedviewfilterrule",
        "delete_token",
        "change_applicationconfiguration",
        "view_correspondent",
        "delete_savedview",
        "view_uisettings",
        "view_token",
        "change_workflowactionwebhook",
        "change_logentry",
        "view_processedmail",
        "add_workflowrun",
        "view_mailrule",
        "change_workflow",
        "delete_groupresult",
        "change_workflowtrigger",
        "add_workflowtrigger",
        "add_note",
        "delete_emailconfirmation",
        "delete_user",
        "view_customfieldinstance",
        "delete_logentry",
        "delete_emailaddress",
        "add_group",
        "add_uisettings",
        "change_emailaddress",
        "add_socialaccount",
        "add_workflowactionemail",
        "change_comment",
        "view_sharelink",
        "add_token",
        "delete_contenttype",
        "change_groupresult",
        "view_storagepath",
        "view_permission",
        "add_sharelink",
        "view_comment",
        "delete_mailrule",
        "change_workflowrun",
        "change_socialapp",
        "delete_customfield",
        "add_logentry",
        "change_authenticator",
        "add_paperlesstask",
        "view_authenticator",
        "change_log",
        "view_documenttype",
        "add_contenttype",
        "add_correspondent",
        "delete_group",
        "delete_userobjectpermission",
        "delete_comment",
        "change_taskresult",
        "change_customfield",
        "delete_savedviewfilterrule",
        "add_log",
        "change_userobjectpermission",
        "change_paperlesstask",
        "change_mailrule",
        "delete_socialaccount",
        "view_emailconfirmation",
        "add_userobjectpermission",
        "add_authenticator",
        "change_tag",
        "add_emailaddress",
        "add_taskresult",
        "add_savedview",
        "change_mailaccount",
        "add_storagepath",
        "delete_socialapp",
        "add_chordcounter",
        "view_socialtoken",
        "view_chordcounter",
        "delete_session",
        "view_user",
        "delete_authenticator",
        "add_processedmail",
        "view_savedviewfilterrule",
        "add_session",
        "add_applicationconfiguration",
        "delete_processedmail",
        "delete_workflow",
        "delete_log",
        "view_socialaccount",
        "delete_tag",
        "change_permission",
        "change_user",
        "add_workflowactionwebhook",
        "view_session",
        "add_mailrule",
        "change_document",
        "delete_note",
        "view_applicationconfiguration",
        "delete_socialtoken",
        "add_groupresult",
        "delete_workflowrun",
        "delete_groupobjectpermission",
        "change_documenttype",
        "add_tokenproxy",
        "delete_sharelink",
        "add_permission",
        "delete_workflowaction",
        "delete_taskresult",
        "delete_permission",
        "delete_workflowactionemail",
        "change_customfieldinstance",
        "add_user",
        "delete_mailaccount",
        "add_workflowaction",
        "view_contenttype",
        "add_documenttype",
        "delete_workflowtrigger",
        "add_logentry",
        "add_customfieldinstance",
        "delete_chordcounter",
        "delete_workflowactionwebhook",
        "view_mailaccount",
        "view_tokenproxy",
        "delete_applicationconfiguration",
        "view_logentry",
        "change_emailconfirmation",
        "change_logentry",
        "view_taskresult",
        "view_log",
        "delete_customfieldinstance",
        "change_sharelink",
        "view_workflowaction",
        "view_groupobjectpermission",
        "change_chordcounter",
        "view_group",
        "view_groupresult",
        "add_tag",
        "view_savedview",
        "add_socialtoken",
        "delete_uisettings",
        "change_workflowactionemail",
        "view_socialapp",
        "change_note",
        "delete_tokenproxy",
        "view_customfield",
        "change_uisettings",
        "change_tokenproxy",
        "view_workflowtrigger",
        "delete_correspondent",
        "change_processedmail",
        "delete_paperlesstask",
        "add_socialapp",
        "delete_logentry",
        "add_comment",
        "view_workflowactionwebhook",
        "add_groupobjectpermission",
        "view_note",
        "change_socialtoken",
        "add_customfield",
        "view_workflow",
        "change_workflowaction",
        "add_workflow",
        "view_document",
        "view_userobjectpermission",
        "add_mailaccount",
        "change_savedview",
        "change_savedviewfilterrule",
        "view_logentry",
        "add_document"
    ]
}
""".data(using: .utf8)!
    
  
    
    let decoder = JSONDecoder()
    let uiSettings = try decoder.decode(UiSettings.self, from: json)
    
    #expect(uiSettings.user == User(id: 2, username: "Demo", email: nil, password: nil, firstName: "Demo", lastName: "User", dateJoined: nil, isStaff: true, isActive: nil, isSuperuser: true, groups: [1], userPermissions: nil, inheritedPermissions: nil))
    
    #expect(uiSettings.settings.updateChecking.enabled ?? false)
    #expect(uiSettings.settings.updateChecking.backendSetting == "true")
    
    #expect(uiSettings.settings.tourComplete ?? false)
    
    #expect(!(uiSettings.settings.bulkEdit?.applyOnClose ?? true))
    #expect(uiSettings.settings.bulkEdit?.confirmationDialogs ?? false)
    
    #expect(uiSettings.settings.documentListSize == 50)
    
    #expect(!(uiSettings.settings.slimSidebar ?? true))
    
    #expect(uiSettings.settings.darkMode?.useSystem ?? false)
    #expect(!(uiSettings.settings.darkMode?.enabled ?? true))
    #expect(uiSettings.settings.darkMode?.thumbInverted ?? false)
    
    #expect(uiSettings.settings.theme?.color == "#65bf40")
    
    #expect(!(uiSettings.settings.documentDetails?.nativePdfViewer ?? true))
    
    #expect(uiSettings.settings.dateDisplay?.dateLocale == "")
    #expect(uiSettings.settings.dateDisplay?.dateFormat == "mediumDate")
    
    #expect(uiSettings.settings.notifications?.consumerNewDocuments ?? false)
    #expect(uiSettings.settings.notifications?.consumerSuccess ?? false)
    #expect(uiSettings.settings.notifications?.consumerFailed ?? false)
    #expect(uiSettings.settings.notifications?.consumerSuppressOnDashboard == false)
    
    #expect(uiSettings.settings.notesEnabled ?? false)
    
    #expect(uiSettings.settings.savedViews?.warnOnUnsavedChange ?? false)
    
    #expect(uiSettings.settings.language == "")
    
    #expect(uiSettings.settings.appTitle == nil)
    #expect(uiSettings.settings.appLogo == nil)
    
    #expect(uiSettings.settings.permissions?.defaultOwner == 2)
    #expect(uiSettings.settings.permissions?.defaultViewUsers == [])
    #expect(uiSettings.settings.permissions?.defaultViewGroups == [])
    #expect(uiSettings.settings.permissions?.defaultEditUsers == [])
    #expect(uiSettings.settings.permissions?.defaultEditGroups == [])
    
    #expect(!(uiSettings.settings.documentEditing?.removeInboxTags ?? true))
    
    #expect(uiSettings.settings.auditlogEnabled)
    
    #expect(!(uiSettings.settings.search?.dbOnly ?? true))
    
    #expect(uiSettings.settings.trashDelay == 30)
    
    
    #expect(uiSettings.permissions.count == 180)
    uiSettings.permissions.forEach { permission in
        if case .unknown(let string) = permission {
            Issue.record("Unknown permission: \(string)")
        }
    }
}
