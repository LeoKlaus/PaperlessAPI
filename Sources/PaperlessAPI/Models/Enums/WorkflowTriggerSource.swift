//
//  WorkflowTriggerSource.swift
//  PaperlessAPI
//
//  Created by Leo Wehrfritz on 14.12.24.
//

public enum WorkflowTriggerSource: RawRepresentable, Codable, Equatable {
    case consumeFolder, apiUpload, mailFetch
    case unknown(Int)
    
    public typealias RawValue = Int
    public init(rawValue: Int) {
        switch rawValue {
        case 1: self = .consumeFolder
        case 2: self = .apiUpload
        case 3: self = .mailFetch
        default: self = .unknown(rawValue)
        }
    }
    
    public var rawValue: Int {
        switch self {
        case .consumeFolder: return 1
        case .apiUpload: return 2
        case .mailFetch: return 3
        case .unknown(let value): return value
        }
    }
}
