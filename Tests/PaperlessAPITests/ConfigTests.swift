//
//  ConfigTests.swift
//  PaperlessAPI
//
//  Created by Leo Wehrfritz on 14.12.24.
//

import Testing
import Foundation
@testable import PaperlessAPI

@Test func decodeConfig() async throws {
    // Write your test here and use APIs like `#expect(...)` to check expected conditions.
    let json = """
{
    "id": 1,
    "user_args": "{}",
    "output_type": "pdfa-1",
    "pages": 5,
    "language": "eng",
    "mode": "skip_noarchive",
    "skip_archive_file": "always",
    "image_dpi": 300,
    "unpaper_clean": "clean",
    "deskew": true,
    "rotate_pages": true,
    "rotate_pages_threshold": 12,
    "max_image_pixels": 3000,
    "color_conversion_strategy": "CMYK",
    "app_title": "Paperparrot Demo",
    "app_logo": null
}
"""
    
    let decoder = JSONDecoder()
    let config = try decoder.decode(Config.self, from: json.data(using: .utf8)!)
    
    #expect(config.id == 1)
    #expect(config.userArgs == "{}")
    #expect(config.outputType == .pdfa1)
    #expect(config.pages == 5)
    #expect(config.language == "eng")
    #expect(config.mode == .skipNoArchive)
    #expect(config.skipArchiveFile == .always)
    #expect(config.imageDpi == 300)
    #expect(config.unpaperClean == .clean)
    #expect(config.deskew ?? false)
    #expect(config.rotatePages ?? false)
    #expect(config.rotatePagesThreshold == 12)
    #expect(config.maxImagePixels == 3000)
    #expect(config.colorConversionStrategy == .cmyk)
    #expect(config.appTitle == "Paperparrot Demo")
    #expect(config.appLogo == nil)
}
