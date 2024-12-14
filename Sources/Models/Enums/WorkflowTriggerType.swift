//
//  WorkflowTriggerType.swift
//  PaperlessAPI
//
//  Created by Leo Wehrfritz on 14.12.24.
//

enum WorkflowTriggerType: RawRepresentable, Codable {
    case consumptionStarted, documentAdded, documentUpdated
    case unknown(Int)
    
    typealias RawValue = Int
    init?(rawValue: Int) {
        switch rawValue {
        case 1: self = .consumptionStarted
        case 2: self = .documentAdded
        case 3: self = .documentUpdated
        default: self = .unknown(rawValue)
        }
    }
    
    var rawValue: Int {
        switch self {
        case .consumptionStarted: return 1
        case .documentAdded: return 2
        case .documentUpdated: return 3
        case .unknown(let value): return value
        }
    }
}
