//
//  CustomFieldExtraData.swift
//  PaperlessAPI
//
//  Created by Leo Wehrfritz on 13.12.24.
//

public struct CustomFieldExtraData: Codable, Hashable {
    public let selectOptions: [String?]?
    public let defaultCurrency: String?
    
    enum CodingKeys: String, CodingKey {
        case selectOptions = "select_options"
        case defaultCurrency = "default_currency"
    }
    
    public init(selectOptions: [String?]?, defaultCurrency: String?) {
        self.selectOptions = selectOptions
        self.defaultCurrency = defaultCurrency
    }
}
