//
//  CustomFieldExtraData.swift
//  PaperlessAPI
//
//  Created by Leo Wehrfritz on 13.12.24.
//

struct CustomFieldExtraData: Codable {
    let selectOptions: [String?]?
    let defaultCurrency: String?
    
    enum CodingKeys: String, CodingKey {
        case selectOptions = "select_options"
        case defaultCurrency = "default_currency"
    }
}
