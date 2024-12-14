//
//  WorkflowTriggerTests.swift
//  PaperlessAPI
//
//  Created by Leo Wehrfritz on 14.12.24.
//

import Testing
import Foundation
@testable import PaperlessAPI

@Test func decodeWorkflowTrigger() async throws {
    
    let json = """
{
  "id": 2,
  "sources": [
    1,
    2
  ],
  "type": 1,
  "filter_path": "filter path",
  "filter_filename": "filter filename",
  "filter_mailrule": 3,
  "matching_algorithm": 0,
  "match": "",
  "is_insensitive": true,
  "filter_has_tags": [
    3,
    7
  ],
  "filter_has_correspondent": null,
  "filter_has_document_type": null
}
""".data(using: .utf8)!
    
    
    let decoder = JSONDecoder()
    let workflowTrigger = try decoder.decode(WorkflowTrigger.self, from: json)
    
    #expect(workflowTrigger.id == 2)
    #expect(workflowTrigger.sources == [
        .consumeFolder,
        .apiUpload
    ])
    #expect(workflowTrigger.type == .consumptionStarted)
    #expect(workflowTrigger.filterPath == "filter path")
    #expect(workflowTrigger.filterFilename == "filter filename")
    #expect(workflowTrigger.filterMailrule == .markAsRead)
    #expect(workflowTrigger.matchingAlgorithm == .matchNone)
    #expect(workflowTrigger.match == "")
    #expect(workflowTrigger.isInsensitive)
    #expect(workflowTrigger.filterHasTags == [
        3,
        7
    ])
    #expect(workflowTrigger.filterHasCorrespondent == nil)
    #expect(workflowTrigger.filterHasDocumentType == nil)
}
