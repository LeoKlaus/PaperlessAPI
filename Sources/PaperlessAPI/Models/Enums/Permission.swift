//
//  Permission.swift
//  PaperlessAPI
//
//  Created by Leo Wehrfritz on 13.12.24.
//

// Ref: https://github.com/paperless-ngx/paperless-ngx/blob/dev/src-ui/src/app/services/permissions.service.spec.ts#L111
public enum PaperlessPermission: RawRepresentable, Codable, Equatable, Hashable, Sendable {
    case applicationConfiguration(PermissionType)
    case chordCounter(PermissionType)
    case comment(PermissionType)
    case contentType(PermissionType)
    case correspondent(PermissionType)
    case customField(PermissionType)
    case customFieldInstance(PermissionType)
    case document(PermissionType)
    case documentType(PermissionType)
    case emailAddress(PermissionType)
    case emailConfirmation(PermissionType)
    case failure(PermissionType)
    case frontendSettings(PermissionType)
    case group(PermissionType)
    case groupObjectPermission(PermissionType)
    case groupResult(PermissionType)
    case log(PermissionType)
    case logEntry(PermissionType)
    case mailAccount(PermissionType)
    case mailRule(PermissionType)
    case note(PermissionType)
    case ormq(PermissionType)
    case paperlessTask(PermissionType)
    case permission(PermissionType)
    case processedMail(PermissionType)
    case savedView(PermissionType)
    case savedViewFilterRule(PermissionType)
    case schedule(PermissionType)
    case session(PermissionType)
    case shareLink(PermissionType)
    case socialAccount(PermissionType)
    case socialApp(PermissionType)
    case socialToken(PermissionType)
    case storagePath(PermissionType)
    case success(PermissionType)
    case tag(PermissionType)
    case task(PermissionType)
    case taskAttributes(PermissionType)
    case taskResult(PermissionType)
    case token(PermissionType)
    case tokenProxy(PermissionType)
    case uiSettings(PermissionType)
    case user(PermissionType)
    case userObjectPermission(PermissionType)
    case workflow(PermissionType)
    case workflowAction(PermissionType)
    case workflowActionEmail(PermissionType)
    case workflowActionRun(PermissionType)
    case workflowActionWebhook(PermissionType)
    case workflowRun(PermissionType)
    case workflowTrigger(PermissionType)
    case authenticator(PermissionType)
    case unknown(String)
    
    public typealias RawValue = String
    public var rawValue: String {
        switch self {
        case .applicationConfiguration(let type):
            return "\(type)_applicationconfiguration"
        case .chordCounter(let type):
            return "\(type)_chordcounter"
        case .comment(let type):
            return "\(type)_comment"
        case .contentType(let type):
            return "\(type)_contenttype"
        case .correspondent(let type):
            return "\(type)_correspondent"
        case .customField(let type):
            return "\(type)_customfield"
        case .customFieldInstance(let type):
            return "\(type)_customfieldinstance"
        case .document(let type):
            return "\(type)_document"
        case .documentType(let type):
            return "\(type)_documenttype"
        case .emailAddress(let type):
            return "\(type)_emailaddress"
        case .emailConfirmation(let type):
            return "\(type)_emailconfirmation"
        case .failure(let type):
            return "\(type)_failure"
        case .frontendSettings(let type):
            return "\(type)_frontendsettings"
        case .group(let type):
            return "\(type)_group"
        case .groupObjectPermission(let type):
            return "\(type)_groupobjectpermission"
        case .groupResult(let type):
            return "\(type)_groupresult"
        case .log(let type):
            return "\(type)_log"
        case .logEntry(let type):
            return "\(type)_logentry"
        case .mailAccount(let type):
            return "\(type)_mailaccount"
        case .mailRule(let type):
            return "\(type)_mailrule"
        case .note(let type):
            return "\(type)_note"
        case .ormq(let type):
            return "\(type)_ormq"
        case .paperlessTask(let type):
            return "\(type)_paperlesstask"
        case .permission(let type):
            return "\(type)_permission"
        case .processedMail(let type):
            return "\(type)_processedmail"
        case .savedView(let type):
            return "\(type)_savedview"
        case .savedViewFilterRule(let type):
            return "\(type)_savedviewfilterrule"
        case .schedule(let type):
            return "\(type)_schedule"
        case .session(let type):
            return "\(type)_session"
        case .shareLink(let type):
            return "\(type)_sharelink"
        case .socialAccount(let type):
            return "\(type)_socialaccount"
        case .socialApp(let type):
            return "\(type)_socialapp"
        case .socialToken(let type):
            return "\(type)_socialtoken"
        case .storagePath(let type):
            return "\(type)_storagepath"
        case .success(let type):
            return "\(type)_success"
        case .tag(let type):
            return "\(type)_tag"
        case .task(let type):
            return "\(type)_task"
        case .taskAttributes(let type):
            return "\(type)_taskattributes"
        case .taskResult(let type):
            return "\(type)_taskresult"
        case .token(let type):
            return "\(type)_token"
        case .tokenProxy(let type):
            return "\(type)_tokenproxy"
        case .uiSettings(let type):
            return "\(type)_uisettings"
        case .user(let type):
            return "\(type)_user"
        case .userObjectPermission(let type):
            return "\(type)_userobjectpermission"
        case .workflow(let type):
            return "\(type)_workflow"
        case .workflowAction(let type):
            return "\(type)_workflowaction"
        case .workflowActionEmail(let type):
            return "\(type)_workflowactionemail"
        case .workflowActionRun(let type):
            return "\(type)_workflowactionrun"
        case .workflowActionWebhook(let type):
            return "\(type)_workflowactionwebhook"
        case .workflowRun(let type):
            return "\(type)_workflowrun"
        case .workflowTrigger(let type):
            return "\(type)_workflowtrigger"
        case .authenticator(let type):
            return "\(type)_authenticator"
        case .unknown(let str):
            return "unknown: \(str)"
        }
    }
    
    public init(rawValue: String) {
        /*
         As only inherited permissions, which are read only, use the identifier
         syntax including the group (i.e. "documents.add_correspondent"),
         it is just dropped when decoding permissions.
         */
        guard let permissionString = rawValue.split(separator: ".", maxSplits: 1).last,
                let typeString = permissionString.split(separator: "_", maxSplits: 1).first else {
            self = .unknown(rawValue)
            return
        }
        let type = PermissionType(rawValue: String(typeString))
        switch permissionString.split(separator: "_").last {
        case "applicationconfiguration":
            self = .applicationConfiguration(type)
        case "chordcounter":
            self = .chordCounter(type)
        case "comment":
            self = .comment(type)
        case "contenttype":
            self = .contentType(type)
        case "correspondent":
            self = .correspondent(type)
        case "customfield":
            self = .customField(type)
        case "customfieldinstance":
            self = .customFieldInstance(type)
        case "document":
            self = .document(type)
        case "documenttype":
            self = .documentType(type)
        case "emailaddress":
            self = .emailAddress(type)
        case "emailconfirmation":
            self = .emailConfirmation(type)
        case "failure":
            self = .failure(type)
        case "frontendsettings":
            self = .frontendSettings(type)
        case "group":
            self = .group(type)
        case "groupobjectpermission":
            self = .groupObjectPermission(type)
        case "groupresult":
            self = .groupResult(type)
        case "log":
            self = .log(type)
        case "logentry":
            self = .logEntry(type)
        case "mailaccount":
            self = .mailAccount(type)
        case "mailrule":
            self = .mailRule(type)
        case "note":
            self = .note(type)
        case "ormq":
            self = .ormq(type)
        case "paperlesstask":
            self = .paperlessTask(type)
        case "permission":
            self = .permission(type)
        case "processedmail":
            self = .processedMail(type)
        case "savedview":
            self = .savedView(type)
        case "savedviewfilterrule":
            self = .savedViewFilterRule(type)
        case "schedule":
            self = .schedule(type)
        case "session":
            self = .session(type)
        case "sharelink":
            self = .shareLink(type)
        case "socialaccount":
            self = .socialAccount(type)
        case "socialapp":
            self = .socialApp(type)
        case "socialtoken":
            self = .socialToken(type)
        case "storagepath":
            self = .storagePath(type)
        case "success":
            self = .success(type)
        case "tag":
            self = .tag(type)
        case "task":
            self = .task(type)
        case "taskattributes":
            self = .taskAttributes(type)
        case "taskresult":
            self = .taskResult(type)
        case "token":
            self = .token(type)
        case "tokenproxy":
            self = .tokenProxy(type)
        case "uisettings":
            self = .uiSettings(type)
        case "user":
            self = .user(type)
        case "userobjectpermission":
            self = .userObjectPermission(type)
        case "workflow":
            self = .workflow(type)
        case "workflowaction":
            self = .workflowAction(type)
        case "workflowactionemail":
            self = .workflowActionEmail(type)
        case "workflowactionrun":
            self = .workflowActionRun(type)
        case "workflowactionwebhook":
            self = .workflowActionWebhook(type)
        case "workflowrun":
            self = .workflowRun(type)
        case "workflowtrigger":
            self = .workflowTrigger(type)
        case "authenticator":
            self = .authenticator(type)
        default:
            self = .unknown(rawValue)
        }
    }
}
