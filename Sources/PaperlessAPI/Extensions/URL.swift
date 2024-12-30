//
//  URL.swift
//  PaperlessAPI
//
//  Created by Leo Wehrfritz on 28.12.24.
//

import Foundation
import UniformTypeIdentifiers

public extension URL {
    /// Returns the uniform type identity for the given file
    var mimeType: String {
        return UTType(filenameExtension: pathExtension)?.preferredMIMEType ?? "application/pdf"
    }
}
