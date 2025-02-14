//
//  PaperlessTask.swift
//  PaperlessAPI
//
//  Created by Leo Wehrfritz on 13.12.24.
//

import Foundation

public struct PaperlessTask: Codable, Identifiable {
    public let id: Int
    public let taskId: UUID
    public let taskFileName: String
    public let dateCreated: Date
    public let dateDone: Date?
    public let type: TaskType
    public let status: TaskStatus
    public let result: String?
    public let acknowledged: Bool
    public let relatedDocument: String?
    
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
    
    public init(id: Int, taskId: UUID, taskFileName: String, dateCreated: Date, dateDone: Date?, type: TaskType, status: TaskStatus, result: String?, acknowledged: Bool, relatedDocument: String?) {
        self.id = id
        self.taskId = taskId
        self.taskFileName = taskFileName
        self.dateCreated = dateCreated
        self.dateDone = dateDone
        self.type = type
        self.status = status
        self.result = result
        self.acknowledged = acknowledged
        self.relatedDocument = relatedDocument
    }
}
