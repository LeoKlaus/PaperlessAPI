//
//  ObjectPermission.swift
//  PaperlessAPI
//
//  Created by Leo Wehrfritz on 15.12.24.
//

public struct ObjectPermissions: Codable, Equatable, Hashable {
    public let view: ObjectPermission
    public let change: ObjectPermission
    
    public init(view: ObjectPermission, change: ObjectPermission) {
        self.view = view
        self.change = change
    }
}

public struct ObjectPermission: Codable, Equatable, Hashable {
    public let users: [Int]
    public let groups: [Int]
    
    public init(users: [Int], groups: [Int]) {
        self.users = users
        self.groups = groups
    }
}
