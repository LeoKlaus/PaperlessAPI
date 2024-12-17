//
//  User.swift
//  PaperlessAPI
//
//  Created by Leo Wehrfritz on 13.12.24.
//

import Foundation

public struct User: ListableObject, ModifiableObject, Equatable {
    
    public static func singularEndpoint(_ id: Int) -> ApiEndpoint {
        .user(id)
    }
    
    public static var pluralEndpoint: ApiEndpoint = .users
    
    public let id: Int
    public let username: String
    public let email: String?
    public let password: String?
    public let firstName: String?
    public let lastName: String?
    public let dateJoined: Date?
    public let isStaff: Bool
    public let isActive: Bool?
    public let isSuperuser: Bool
    public let groups: [Int]
    public let userPermissions: [Permission]?
    public let inheritedPermissions: [Permission]?
    
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
}
