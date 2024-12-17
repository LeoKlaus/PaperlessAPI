//
//  FilterRule.swift
//  PaperlessAPI
//
//  Created by Leo Wehrfritz on 13.12.24.
//

public struct FilterRule: Codable, Equatable {
    public let ruleType: RuleType
    public let value: String
    
    enum CodingKeys: String, CodingKey {
        case ruleType = "rule_type"
        case value
    }
}
