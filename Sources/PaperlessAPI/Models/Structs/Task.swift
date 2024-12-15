//
//  File.swift
//  PaperlessAPI
//
//  Created by Leo Wehrfritz on 13.12.24.
//

import Foundation

public struct Task: Codable {
    let id: Int
    let taskId: UUID
    let taskFileName: String
    let dateCreated: Date
    let dateDone: Date?
    let type: TaskType
    let status: TaskStatus
    let result: String?
    let acknowledged: Bool
    let relatedDocument: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case taskId = "task_id"
        case taskFileName = "task_file_name"
        case dateCreated = "date_created"
        case dateDone = "date_done"
        case type
        case status
        case result
        case acknowledged
        case relatedDocument = "related_document"
    }
}
