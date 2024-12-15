//
//  Config.swift
//  PaperlessAPI
//
//  Created by Leo Wehrfritz on 14.12.24.
//

import Foundation

public struct Config: Codable {
    let id: Int
    let userArgs: String?
    let outputType: ConfigOutputType?
    let pages: Int?
    let language: String?
    let mode: ConfigMode?
    let skipArchiveFile: ConfigSkipArchiveFile?
    let imageDpi: Int?
    let unpaperClean: ConfigUnpaperClean?
    let deskew: Bool?
    let rotatePages: Bool?
    let rotatePagesThreshold: Int?
    let maxImagePixels: Int?
    let colorConversionStrategy: ConfigColorConversionStrategy?
    let appTitle: String?
    let appLogo: URL?
    
    enum CodingKeys: String, CodingKey {
        case id
        case userArgs = "user_args"
        case outputType = "output_type"
        case pages
        case language
        case mode
        case skipArchiveFile = "skip_archive_file"
        case imageDpi = "image_dpi"
        case unpaperClean = "unpaper_clean"
        case deskew
        case rotatePages = "rotate_pages"
        case rotatePagesThreshold = "rotate_pages_threshold"
        case maxImagePixels = "max_image_pixels"
        case colorConversionStrategy = "color_conversion_strategy"
        case appTitle = "app_title"
        case appLogo = "app_logo"
    }
}
