//
//  CustomFieldExtraData.swift
//  PaperlessAPI
//
//  Created by Leo Wehrfritz on 13.12.24.
//

public struct CustomFieldExtraData: Codable {
    public let selectOptions: [String?]?
    public let defaultCurrency: String?
    
    enum CodingKeys: String, CodingKey {
        case selectOptions = "select_options"
        case defaultCurrency = "default_currency"
    }
}
