//
//  RemoteVersionTests.swift
//  PaperlessAPI
//
//  Created by Leo Wehrfritz on 14.12.24.
//

import Testing
import Foundation
@testable import PaperlessAPI

@Test func decodeRemoteVersion() async throws {
    // Write your test here and use APIs like `#expect(...)` to check expected conditions.
    let json = """
{
    "version": "v2.13.5",
    "update_available": true
}
"""
    
    let decoder = JSONDecoder()
    let remoteVersion = try decoder.decode(RemoteVersion.self, from: json.data(using: .utf8)!)
    
    #expect(remoteVersion.version == "v2.13.5")
    #expect(remoteVersion.updateAvailable)
}

