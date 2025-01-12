//
//  CustomFieldValueTests.swift
//  PaperlessAPI
//
//  Created by Leo Wehrfritz on 12.12.24.
//

import Testing
import Foundation
@testable import PaperlessAPI

@Test func decodeCustomFieldBoolean() async throws {
    // Write your test here and use APIs like `#expect(...)` to check expected conditions.
    let json = """
{
    "value": true,
    "field": 1
}
"""
    
    let decoder = JSONDecoder()
    let value = try decoder.decode(CustomFieldContent.self, from: json.data(using: .utf8)!)
    
    #expect(value.value == .boolean(true))
}

@Test func decodeCustomFieldNumber() async throws {
    // Write your test here and use APIs like `#expect(...)` to check expected conditions.
    let json = """
{
    "value": 2.1,
    "field": 1
}
"""
    
    let decoder = JSONDecoder()
    let value = try decoder.decode(CustomFieldContent.self, from: json.data(using: .utf8)!)
    
    #expect(value.value == .number(2.1))
}

@Test func decodeCustomFieldText() async throws {
    // Write your test here and use APIs like `#expect(...)` to check expected conditions.
    let json = """
{
    "value": "ABC",
    "field": 1
}
"""
    
    let decoder = JSONDecoder()
    let value = try decoder.decode(CustomFieldContent.self, from: json.data(using: .utf8)!)
    
    #expect(value.value == .text("ABC"))
}

@Test func decodeCustomFieldDocLink() async throws {
    // Write your test here and use APIs like `#expect(...)` to check expected conditions.
    let json = """
{
    "value": [
        1,
        2,
        3
    ],
    "field": 11
}
"""
    
    let decoder = JSONDecoder()
    let value = try decoder.decode(CustomFieldContent.self, from: json.data(using: .utf8)!)
    
    #expect(value.value == .docLink([1,2,3]))
}

@Test func decodeCustomFieldValueMonetary() async throws {
    let json = """
{
    "value": "EUR6.20",
    "field": 15
}
"""
    
    let decoder = JSONDecoder()
    let value = try decoder.decode(CustomFieldContent.self, from: json.data(using: .utf8)!)
    
    #expect(value.value == .monetary(6.2, "EUR"))
}

@Test func encodeCustomFieldValueMonetary() async throws {
    let encoder = JSONEncoder()
    let fieldValue = CustomFieldContent(value: .monetary(6.20, "EUR"), field: 15)
    let value = try encoder.encode(fieldValue)
    
    let valueDict = try JSONSerialization.jsonObject(with: value, options: []) as? [String: Any]
    
    #expect(valueDict?["value"] as? String == "EUR6.20")
    #expect(valueDict?["field"] as? Int == 15)
}
