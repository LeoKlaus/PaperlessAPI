//
//  Workflow.swift
//  PaperlessAPI
//
//  Created by Leo Wehrfritz on 14.12.24.
//

public struct Workflow: ListableObject {
    public let id: Int
    let name: String
    let order: Int
    let enabled: Bool
    let triggers: [WorkflowTrigger]
    let actions: [WorkflowAction]
}
