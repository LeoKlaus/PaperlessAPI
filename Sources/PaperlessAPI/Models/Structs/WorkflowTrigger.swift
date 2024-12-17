//
//  WorkflowTrigger.swift
//  PaperlessAPI
//
//  Created by Leo Wehrfritz on 14.12.24.
//

import Foundation

public struct WorkflowTrigger: ListableObject, ModifiableObject, Equatable {
    
    public static func singularEndpoint(_ id: Int) -> ApiEndpoint {
        .workflowTrigger(id)
    }
    
    public static var pluralEndpoint: ApiEndpoint = .workflowTriggers
    
    public let id: Int
    public let sources: [WorkflowTriggerSource]
    public let type: WorkflowTriggerType
    public let filterPath: String?
    public let filterFilename: String?
    public let filterMailrule: MailRuleAction?
    public let matchingAlgorithm: MatchingAlgorithm
    public let match: String
    public let isInsensitive: Bool
    public let filterHasTags: [Int]
    public let filterHasCorrespondent: Int?
    public let filterHasDocumentType: Int?
    
    enum CodingKeys: String, CodingKey {
        case id
        case sources
        case type
        case filterPath = "filter_path"
        case filterFilename = "filter_filename"
        case filterMailrule = "filter_mailrule"
        case matchingAlgorithm = "matching_algorithm"
        case match
        case isInsensitive = "is_insensitive"
        case filterHasTags = "filter_has_tags"
        case filterHasCorrespondent = "filter_has_correspondent"
        case filterHasDocumentType = "filter_has_document_type"
    }
}
