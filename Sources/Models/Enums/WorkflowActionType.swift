//
//  WorkflowActionType.swift
//  PaperlessAPI
//
//  Created by Leo Wehrfritz on 14.12.24.
//

enum WorkflowActionType: RawRepresentable, Codable {
    case assignment, removal
    case unknown(Int)
    
    typealias RawValue = Int
    init(rawValue: Int) {
        switch rawValue {
        case 1: self = .assignment
        case 2: self = .removal
        default: self = .unknown(rawValue)
        }
    }
    
    var rawValue: Int {
        switch self {
        case .assignment: return 1
        case .removal: return 2
        case .unknown(let value): return value
        }
    }
}
