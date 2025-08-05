//
//  JSONEncoder.swift
//  PaperlessAPI
//
//  Created by Leo Wehrfritz on 05.08.25.
//

import Foundation

public extension JSONEncoder.DateEncodingStrategy {
    static let iso8601WithoutTimeZone = custom { (date, encoder) in
        let formatter = Formatter.iso8601withoutTimeZone
        let stringData = formatter.string(from: date)
        var container = encoder.singleValueContainer()
        try container.encode(stringData)
    }
}
