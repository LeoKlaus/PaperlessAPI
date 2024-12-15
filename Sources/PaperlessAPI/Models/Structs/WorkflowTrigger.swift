//
//  WorkflowTrigger.swift
//  PaperlessAPI
//
//  Created by Leo Wehrfritz on 14.12.24.
//

import Foundation

struct WorkflowTrigger: PaperlessObject, Equatable {
    let id: Int
    let sources: [WorkflowTriggerSource]
    let type: WorkflowTriggerType
    let filterPath: String?
    let filterFilename: String?
    let filterMailrule: MailRuleAction?
    let matchingAlgorithm: MatchingAlgorithm
    let match: String
    let isInsensitive: Bool
    let filterHasTags: [Int]
    let filterHasCorrespondent: Int?
    let filterHasDocumentType: Int?
    
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
