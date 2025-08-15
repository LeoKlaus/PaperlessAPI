//
//  File.swift
//  PaperlessAPI
//
//  Created by Leo Wehrfritz on 12.12.24.
//

import Foundation

public enum CustomFieldValue: Codable, Equatable, Hashable, Sendable {
    case boolean(Bool)
    case number(Float)
    case text(String)
    case monetary(Float, String)
    case docLink([Int])
    case `nil`
    
    public func value(forBulkEdit: Bool = false) -> Any? {
        switch self {
        case .text(let string):
            return string
        case .boolean(let bool):
            return bool
        case .number(let float):
            return float
        case .docLink(let docIDs):
            return docIDs
        case .monetary(let float, let currency):
            if forBulkEdit {
                let formatter = NumberFormatter()
                formatter.minimumFractionDigits = 2
                formatter.maximumFractionDigits = 2
                formatter.decimalSeparator = "."
                return currency + (formatter.string(for: float) ?? "0")
            }
            return (float, currency)
        case .nil:
            return nil
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .text(let string):
            try container.encode(string)
        case .boolean(let bool):
            try container.encode(bool)
        case .number(let float):
            try container.encode(float)
        case .docLink(let docIDs):
            try container.encode(docIDs)
        case .monetary(let float, let currency):
            let formatter = NumberFormatter()
            formatter.minimumFractionDigits = 2
            formatter.maximumFractionDigits = 2
            formatter.decimalSeparator = "."
            guard let str = formatter.string(for: float) else {
                throw EncodingError.invalidValue(float, EncodingError.Context(codingPath: [], debugDescription: "Could not encode monetary value"))
            }
            try container.encode(currency + str)
        case .nil:
            try container.encodeNil()
        }
    }
    
    public init(from decoder: Decoder) throws {
        if let string = try? decoder.singleValueContainer().decode(String.self) {
            let regex = #/^([^-\d]*)(-?[\d]*\.[\d][\d])$/#
            if let match = string.matches(of: regex).first, let float = Float(match.2) {
                self = .monetary(float, String(match.1))
                return
            }
            self = .text(string)
            return
        }
        
        if let bool = try? decoder.singleValueContainer().decode(Bool.self) {
            self = .boolean(bool)
            return
        }
        
        if let float = try? decoder.singleValueContainer().decode(Float.self) {
            self = .number(float)
            return
        }
        
        if let docIDs = try? decoder.singleValueContainer().decode([Int].self) {
            self = .docLink(docIDs)
            return
        }
        
        if let _ = try? decoder.singleValueContainer().decodeNil() {
            self = .nil
            return
        }
        
        throw DecodingError.typeMismatch(CustomFieldValue.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Could not decode CustomFieldValue"))
    }
}
