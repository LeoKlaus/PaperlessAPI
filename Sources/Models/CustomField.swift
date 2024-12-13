//
//  CustomField.swift
//  PaperlessAPI
//
//  Created by Leo Wehrfritz on 12.12.24.
//

import Foundation

struct CustomField: Codable {
    var id: Int
    var name: String
    var data_type: CustomFieldDataType
    var extra_data: CustomFieldExtraData?
}

enum CustomFieldDataType: String, Codable {
    case string, url, date, boolean, integer, float, monetary, documentlink, select
}

struct CustomFieldContent: Codable, Equatable {
    let value: CustomFieldValue
    let field: Int
}

struct CustomFieldExtraData: Codable {
    let select_options: [String?]?
    let default_currency: String?
}
