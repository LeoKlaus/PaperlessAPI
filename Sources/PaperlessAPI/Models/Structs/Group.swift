//
//  Group.swift
//  PaperlessAPI
//
//  Created by Leo Wehrfritz on 14.12.24.
//

import Foundation

public struct PaperlessGroup: ListableObject, ModifiableObject {
    public static func singularEndpoint(_ id: Int) -> ApiEndpoint {
        .group(id)
    }
    
    public static var pluralEndpoint: ApiEndpoint = .groups
    
    public let id: Int
    public let name: String
    public let permissions: [Permission]
}
