//
//  CustomField.swift
//  PaperlessAPI
//
//  Created by Leo Wehrfritz on 12.12.24.
//

import Foundation

public struct CustomField: PaperlessObject {
    public var id: Int
    var name: String
    var dataType: CustomFieldDataType
    var extraData: CustomFieldExtraData?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case dataType = "data_type"
        case extraData = "extra_data"
    }
}
