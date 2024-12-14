//
//  Workflow.swift
//  PaperlessAPI
//
//  Created by Leo Wehrfritz on 14.12.24.
//

struct Workflow: Codable {
    let id: Int
    let name: String
    let order: Int
    let enabled: Bool
    let triggers: [WorkflowTrigger]
    let actions: [WorkflowAction]
}
