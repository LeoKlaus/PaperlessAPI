//
//  SavedViewDisplayFields.swift
//  PaperlessAPI
//
//  Created by Leo Wehrfritz on 15.12.24.
//

import Foundation

enum SavedViewDisplayFields: RawRepresentable, Codable {
    case title, created, tag, correspondent, documentType, storagePath, note, owner, shared, asn, added
    case customField(Int)
    case unknown(String)
    
    //private static let customFieldRegex = /(custom_field_)(\d)+/
    
    typealias RawValue = String
    init?(rawValue: String) {
        
        /*if let match = customFieldRegex.firstMatch(in: rawValue), let customFieldId = Int(match.2) {
            self = .customField(customFieldId)
        }*/
        
        switch rawValue {
        case "title": self = .title
        case "created": self = .created
        case "tag": self = .tag
        case "correspondent": self = .correspondent
        case "documenttype": self = .documentType
        case "storagepath": self = .storagePath
        case "note": self = .note
        case "owner": self = .owner
        default: self = .unknown(rawValue)
        }
    }
    
    var rawValue: String {
        switch self {
        case .title: return "title"
        case .created: return "created"
        case .tag: return "tag"
        case .correspondent: return "correspondent"
        case .documentType: return "documenttype"
        case .storagePath: return "storagepath"
        case .note: return "note"
        case .owner: return "owner"
        case .shared: return "shared"
        case .asn: return "asn"
        case .added: return "added"
        case .customField(let value): return "custom_field_(\(value))"
        case .unknown(let value): return value
        }
    }
}
