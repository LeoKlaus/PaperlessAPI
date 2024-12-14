//
//  CustomFieldTests.swift
//  PaperlessAPI
//
//  Created by Leo Wehrfritz on 14.12.24.
//

import Testing
import Foundation
@testable import PaperlessAPI

@Test func decodeCustomField() async throws {
    
    let json = """
{
    "id": 13,
    "name": "Year of purchase",
    "data_type": "integer",
    "extra_data": null
}
""".data(using: .utf8)!
    
    
    let decoder = JSONDecoder()
    let customField = try decoder.decode(CustomField.self, from: json)
    
    #expect(customField.id == 13)
    #expect(customField.name == "Year of purchase")
    #expect(customField.dataType == .integer)
    #expect(customField.extraData == nil)
}

@Test func decodeCustomFieldMonetary() async throws {
    
    let json = """
{
    "id": 15,
    "name": "Total Price",
    "data_type": "monetary",
    "extra_data": {
        "default_currency": "EUR"
    }
}
""".data(using: .utf8)!
    
    
    let decoder = JSONDecoder()
    let customField = try decoder.decode(CustomField.self, from: json)
    
    #expect(customField.id == 15)
    #expect(customField.name == "Total Price")
    #expect(customField.dataType == .monetary)
    #expect(customField.extraData?.defaultCurrency == "EUR")
}

@Test func decodeCustomFieldSelect() async throws {
    
    let json = """
{
    "id": 27,
    "name": "Solution",
    "data_type": "select",
    "extra_data": {
        "select_options": [
            "A",
            "C",
            "D"
        ]
    }
}
""".data(using: .utf8)!
    
    
    let decoder = JSONDecoder()
    let customField = try decoder.decode(CustomField.self, from: json)
    
    #expect(customField.id == 27)
    #expect(customField.name == "Solution")
    #expect(customField.dataType == .select)
    #expect(customField.extraData?.selectOptions == [
        "A", "C", "D"
    ])
}
