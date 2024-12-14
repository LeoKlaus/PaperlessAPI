//
//  ColorTests.swift
//  PaperlessAPI
//
//  Created by Leo Wehrfritz on 14.12.24.
//

import Testing
import Foundation
import SwiftUI

@Test func decodeColor() async throws {
    // Write your test here and use APIs like `#expect(...)` to check expected conditions.
    let json = "\"#FF0000\"".data(using: .utf8)!
    
    let decoder = JSONDecoder()
    let color = try decoder.decode(Color.self, from: json)
    
    #expect(color == Color(.sRGB, red: 1, green: 0, blue:  0, opacity: 1))
}

@Test func encodeColor() async throws {
    // Write your test here and use APIs like `#expect(...)` to check expected conditions.
    let color = Color(uiColor: .blue)
    
    let encoder = JSONEncoder()
    let encodedColor = try encoder.encode(color)
    
    #expect(encodedColor == "\"#0000FF\"".data(using: .utf8)!)
}
