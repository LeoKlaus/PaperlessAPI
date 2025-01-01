//
//  SavedViewDisplayFields.swift
//  PaperlessAPI
//
//  Created by Leo Wehrfritz on 15.12.24.
//

import Foundation

public enum SavedViewDisplayField: RawRepresentable, Codable, Hashable, Identifiable {
    case title, created, tags, correspondent, documentType, storagePath, notes, owner, shared, asn, added, pageCount
    case customField(Int)
    case unknown(String)
    
    public var id: String {
        rawValue
    }
    
    public typealias RawValue = String
    public init?(rawValue: String) {
        
        let customFieldRegex = /custom_field_(\d+)/
        if let match = try? customFieldRegex.firstMatch(in: rawValue), let customFieldId = Int(match.1) {
            self = .customField(customFieldId)
            return
        }
        
        switch rawValue {
        case "title": self = .title
        case "created": self = .created
        case "tag": self = .tags
        case "correspondent": self = .correspondent
        case "documenttype": self = .documentType
        case "storagepath": self = .storagePath
        case "note": self = .notes
        case "owner": self = .owner
        case "pagecount": self = .pageCount
        default: self = .unknown(rawValue)
        }
    }
    
    public var rawValue: String {
        switch self {
        case .title: return "title"
        case .created: return "created"
        case .tags: return "tag"
        case .correspondent: return "correspondent"
        case .documentType: return "documenttype"
        case .storagePath: return "storagepath"
        case .notes: return "note"
        case .owner: return "owner"
        case .shared: return "shared"
        case .asn: return "asn"
        case .added: return "added"
        case .pageCount: return "pagecount"
        case .customField(let value): return "custom_field_(\(value))"
        case .unknown(let value): return value
        }
    }
}
