//
//  SavedViewSortField.swift
//  PaperlessAPI
//
//  Created by Leo Wehrfritz on 15.01.25.
//


public enum SavedViewSortField: RawRepresentable, Codable, Hashable, Sendable {
    case asn, correspondent, title, documentType, created, added, modified, notes, owner, pages
    case unknown(String)
    
    public typealias RawValue = String
    public var rawValue: String {
        switch self {
        case .asn:
            return "archive_serial_number"
        case .correspondent:
            return "correspondent__name"
        case .title:
            return "title"
        case .documentType:
            return "document_type__name"
        case .created:
            return "created"
        case .added:
            return "added"
        case .modified:
            return "modified"
        case .notes:
            return "num_notes"
        case .owner:
            return "owner"
        case .pages:
            return "page_count"
        case .unknown(let value): return value
        }
    }
    
    public init(rawValue: String) {
        switch rawValue {
        case "archive_serial_number":
            self = .asn
        case "added":
            self = .added
        case "correspondent__name":
            self = .correspondent
        case "created":
            self = .created
        case "document_type__name":
            self = .documentType
        case "modified":
            self = .modified
        case "num_notes":
            self = .notes
        case "owner":
            self = .owner
        case "page_count":
            self = .pages
        case "title":
            self = .title
        default:
            self = .unknown(rawValue)
        }
    }
}
