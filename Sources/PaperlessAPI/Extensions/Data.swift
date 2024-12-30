//
//  Data.swift
//  PaperlessAPI
//
//  Created by Leo Wehrfritz on 28.12.24.
//

import Foundation

extension Data {
    mutating func append(_ string: String, using encoding: String.Encoding = .utf8) {
        if let data = string.data(using: encoding) {
            append(data)
        }
    }
}
