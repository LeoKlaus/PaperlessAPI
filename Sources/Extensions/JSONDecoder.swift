//
//  JSONDecoder.swift
//  PaperlessAPI
//
//  Created by Leo Wehrfritz on 12.12.24.
//

import Foundation

extension JSONDecoder.DateDecodingStrategy {
    
    static let iso8601withFractionalSeconds = custom {
        let container = try $0.singleValueContainer()
        let string = try container.decode(String.self)
        guard let date = Formatter.iso8601withFractionalSeconds.date(from: string) else {
            throw DecodingError.dataCorruptedError(in: container,
                                                   debugDescription: "Invalid date: \(string)")
        }
        return date
    }
    
    static let iso8601withoutFractionalSeconds = custom {
        let container = try $0.singleValueContainer()
        let string = try container.decode(String.self)
        guard let date = Formatter.iso8601withoutFractionalSeconds.date(from: string) else {
            throw DecodingError.dataCorruptedError(in: container,
                                                   debugDescription: "Invalid date: \(string)")
        }
        return date
    }
    
    static let iso8601WithOptionalFractionalSecondsAndYMD = custom {
        let container = try $0.singleValueContainer()
        let string = try container.decode(String.self)
        if let date = Formatter.iso8601withFractionalSeconds.date(from: string) ?? Formatter.iso8601withoutFractionalSeconds.date(from: string) ?? Formatter.yearMonthDayString.date(from: string) {
            return date
        }
        throw DecodingError.dataCorruptedError(in: container, debugDescription: "Invalid date: \(string)")
    }
    
    static let paperlessDateFormat = Self.iso8601WithOptionalFractionalSecondsAndYMD
}
