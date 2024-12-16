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
    let username: String
    let email: String?
    let password: String?
    let firstName: String?
    let lastName: String?
    let dateJoined: Date?
    let isStaff: Bool
    let isActive: Bool?
    let isSuperuser: Bool
    let groups: [Int]
    let userPermissions: [Permission]?
    let inheritedPermissions: [Permission]?
    
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
