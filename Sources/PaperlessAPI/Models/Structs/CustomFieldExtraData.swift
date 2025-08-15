//
//  CustomFieldExtraData.swift
//  PaperlessAPI
//
//  Created by Leo Wehrfritz on 13.12.24.
//

import Foundation

public struct CustomFieldSelectOption: Codable, Identifiable, Hashable, Sendable {
    public let id: String
    public var label: String
    
    enum CodingKeys: String, CodingKey {
        case id, label
    }
    
    public init(from decoder: Decoder) throws {
        if let container = try? decoder.container(keyedBy: CodingKeys.self) {
            self.id = try container.decode(String.self, forKey: .id)
            self.label = try container.decode(String.self, forKey: .label)
        } else {
            let container = try decoder.singleValueContainer()
            self.id = UUID().uuidString
            self.label = try container.decode(String.self)
        }
    }
    
    public init(id: String = UUID().uuidString, _ label: String) {
        self.id = id
        self.label = label
    }
    
    public func encode(to encoder: any Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(label)
    }
}

public struct CustomFieldExtraData: Codable, Hashable, Sendable {
    public var selectOptions: [CustomFieldSelectOption]?
    public var defaultCurrency: String?
    
    enum CodingKeys: String, CodingKey {
        case selectOptions = "select_options"
        case defaultCurrency = "default_currency"
    }
    
    public init(selectOptions: [CustomFieldSelectOption]?, defaultCurrency: String?) {
        self.selectOptions = selectOptions
        self.defaultCurrency = defaultCurrency
    }
}
