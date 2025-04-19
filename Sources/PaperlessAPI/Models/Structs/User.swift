//
//  User.swift
//  PaperlessAPI
//
//  Created by Leo Wehrfritz on 13.12.24.
//

import Foundation

public struct User: ListableObject, ModifiableObject, Hashable, Sendable {
    
    public static func singularEndpoint(_ id: Int) -> ApiEndpoint {
        .user(id)
    }
    
    public static var pluralEndpoint: ApiEndpoint = .users
    
    public var id: Int
    public let username: String
    public let email: String?
    public let password: String?
    public let firstName: String?
    public let lastName: String?
    public let dateJoined: Date?
    public let isStaff: Bool?
    public let isActive: Bool?
    public let isSuperuser: Bool?
    public let groups: [Int]?
    public let userPermissions: [PaperlessPermission]?
    public let inheritedPermissions: [PaperlessPermission]?
    
    enum CodingKeys: String, CodingKey {
        case id
        case username
        case email
        case password
        case firstName = "first_name"
        case lastName = "last_name"
        case dateJoined = "date_joined"
        case isStaff = "is_staff"
        case isActive = "is_active"
        case isSuperuser = "is_superuser"
        case groups
        case userPermissions = "user_permissions"
        case inheritedPermissions = "inherited_permissions"
    }
    
    public init(id: Int, username: String, email: String?, password: String?, firstName: String?, lastName: String?, dateJoined: Date?, isStaff: Bool, isActive: Bool?, isSuperuser: Bool, groups: [Int], userPermissions: [PaperlessPermission]?, inheritedPermissions: [PaperlessPermission]?) {
        self.id = id
        self.username = username
        self.email = email
        self.password = password
        self.firstName = firstName
        self.lastName = lastName
        self.dateJoined = dateJoined
        self.isStaff = isStaff
        self.isActive = isActive
        self.isSuperuser = isSuperuser
        self.groups = groups
        self.userPermissions = userPermissions
        self.inheritedPermissions = inheritedPermissions
    }
}
