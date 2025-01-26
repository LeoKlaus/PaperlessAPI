//
//  Group.swift
//  PaperlessAPI
//
//  Created by Leo Wehrfritz on 14.12.24.
//

import Foundation

public struct PaperlessGroup: ListableObject, ModifiableObject, Hashable {
    public static func singularEndpoint(_ id: Int) -> ApiEndpoint {
        .group(id)
    }
    
    public static var pluralEndpoint: ApiEndpoint = .groups
    
    public var id: Int
    public let name: String
    public let permissions: [Permission]
    
    public init(id: Int, name: String, permissions: [Permission]) {
        self.id = id
        self.name = name
        self.permissions = permissions
    }
}
