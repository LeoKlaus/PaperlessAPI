//
//  File.swift
//  PaperlessAPI
//
//  Created by Leo Wehrfritz on 12.12.24.
//

import Foundation

public enum CustomFieldValue: Codable, Equatable, Hashable {
    case boolean(Bool)
    case number(Float)
    case text(String)
    case docLink([Int])
    case `nil`
    
    public func value() -> Any? {
        switch self {
        case .text(let string):
            return string
        case .boolean(let bool):
            return bool
        case .number(let float):
            return float
        case .docLink(let docIDs):
            return docIDs
        case .nil:
            return nil
        }
    }
    
    public init(from decoder: Decoder) throws {
        if let string = try? decoder.singleValueContainer().decode(String.self) {
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
