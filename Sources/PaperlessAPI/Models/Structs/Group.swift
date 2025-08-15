//
//  Group.swift
//  PaperlessAPI
//
//  Created by Leo Wehrfritz on 14.12.24.
//

import Foundation

public struct PaperlessGroup: ListableObject, ModifiableObject, Hashable, Sendable {
    public static func singularEndpoint(_ id: Int) -> ApiEndpoint {
        .group(id)
    }
    
    public static let pluralEndpoint: ApiEndpoint = .groups
    
    public var id: Int
    public let name: String
    public let permissions: [PaperlessPermission]
    
    public init(id: Int, name: String, permissions: [PaperlessPermission]) {
        self.id = id
        self.name = name
        self.permissions = permissions
    }
}
