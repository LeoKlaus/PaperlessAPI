//
//  ModifiableObject.swift
//  PaperlessAPI
//
//  Created by Leo Wehrfritz on 15.12.24.
//

public protocol ModifiableObject: ListableObject {
    static func singularEndpoint(_ id: Int) -> ApiEndpoint
    static var pluralEndpoint: ApiEndpoint { get }
}
