//
//  Workflow.swift
//  PaperlessAPI
//
//  Created by Leo Wehrfritz on 14.12.24.
//

public struct Workflow: ListableObject, ModifiableObject {
    
    public static func singularEndpoint(_ id: Int) -> ApiEndpoint {
        .workflow(id)
    }
    
    public static var pluralEndpoint: ApiEndpoint = .workflows
    
    public let id: Int
    public let name: String
    public let order: Int
    public let enabled: Bool
    public let triggers: [WorkflowTrigger]
    public let actions: [WorkflowAction]
}
