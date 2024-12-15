//
//  TokenTests.swift
//  PaperlessAPI
//
//  Created by Leo Wehrfritz on 15.12.24.
//

import Testing
import Foundation
@testable import PaperlessAPI

@Test func decodeToken() async throws {
    
    let json = """
{
  "token": "ba3fca9baskdhakjdjkdwwed076a4e7e"
}
""".data(using: .utf8)!
    
    
    let decoder = JSONDecoder()
    let tokenResponse = try decoder.decode(TokenResponse.self, from: json)
    
    #expect(tokenResponse.token == "ba3fca9baskdhakjdjkdwwed076a4e7e")
}
