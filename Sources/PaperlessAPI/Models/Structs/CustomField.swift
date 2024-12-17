//
//  CustomField.swift
//  PaperlessAPI
//
//  Created by Leo Wehrfritz on 12.12.24.
//

import Foundation

public struct CustomField: ListableObject, ModifiableObject {
    
    public static func singularEndpoint(_ id: Int) -> ApiEndpoint {
        .customField(id)
    }
    
    public static var pluralEndpoint: ApiEndpoint = .customFields
    
    public let id: Int
    public let name: String
    public let dataType: CustomFieldDataType
    public let extraData: CustomFieldExtraData?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case dataType = "data_type"
        case extraData = "extra_data"
    }
}
