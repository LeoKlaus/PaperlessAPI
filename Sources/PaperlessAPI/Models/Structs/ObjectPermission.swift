//
//  ObjectPermission.swift
//  PaperlessAPI
//
//  Created by Leo Wehrfritz on 15.12.24.
//

public struct ObjectPermissions: Codable, Equatable, Hashable {
    public var view: ObjectPermission
    public var change: ObjectPermission
    
    public init(view: ObjectPermission, change: ObjectPermission) {
        self.view = view
        self.change = change
    }
}

public struct ObjectPermission: Codable, Equatable, Hashable {
    public var users: [Int]
    public var groups: [Int]
    
    public init(users: [Int], groups: [Int]) {
        self.users = users
        self.groups = groups
    }
}
