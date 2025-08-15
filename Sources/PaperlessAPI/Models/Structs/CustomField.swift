//
//  CustomField.swift
//  PaperlessAPI
//
//  Created by Leo Wehrfritz on 12.12.24.
//

import Foundation

public struct CustomField: ListableObject, ModifiableObject, Hashable, Sendable {
    
    public static func singularEndpoint(_ id: Int) -> ApiEndpoint {
        .customField(id)
    }
    
    public static let pluralEndpoint: ApiEndpoint = .customFields
    
    public var id: Int
    public var name: String
    public let dataType: CustomFieldDataType
    public var extraData: CustomFieldExtraData?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case dataType = "data_type"
        case extraData = "extra_data"
    }
    
    public init(id: Int, name: String, dataType: CustomFieldDataType, extraData: CustomFieldExtraData?) {
        self.id = id
        self.name = name
        self.dataType = dataType
        self.extraData = extraData
    }
}
