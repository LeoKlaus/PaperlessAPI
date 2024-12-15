//
//  ObjectPermission.swift
//  PaperlessAPI
//
//  Created by Leo Wehrfritz on 15.12.24.
//

public struct ObjectPermissions: Codable, Equatable {
    public let view: ObjectPermission
    public let change: ObjectPermission
}

public struct ObjectPermission: Codable, Equatable {
    public let users: [Int]
    public let groups: [Int]
}
