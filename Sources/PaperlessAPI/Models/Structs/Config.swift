//
//  Config.swift
//  PaperlessAPI
//
//  Created by Leo Wehrfritz on 14.12.24.
//

import Foundation

public struct Config: Codable {
    public let id: Int
    public let userArgs: String?
    public let outputType: ConfigOutputType?
    public let pages: Int?
    public let language: String?
    public let mode: ConfigMode?
    public let skipArchiveFile: ConfigSkipArchiveFile?
    public let imageDpi: Int?
    public let unpaperClean: ConfigUnpaperClean?
    public let deskew: Bool?
    public let rotatePages: Bool?
    public let rotatePagesThreshold: Int?
    public let maxImagePixels: Int?
    public let colorConversionStrategy: ConfigColorConversionStrategy?
    public let appTitle: String?
    public let appLogo: URL?
    
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
