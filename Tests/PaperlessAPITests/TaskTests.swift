//
//  TaskTests.swift
//  PaperlessAPI
//
//  Created by Leo Wehrfritz on 13.12.24.
//

import Testing
import Foundation
@testable import PaperlessAPI

@Test func decodeTask() async throws {
    
    let json = """
{
  "id": 340,
  "task_id": "697a1e14-16e9-4963-9641-e298cc49cdf5",
  "task_file_name": "Example_Document.pdf",
  "date_created": "2024-12-12T16:24:51.692853+01:00",
  "date_done": "2024-12-12T16:24:56.996137+01:00",
  "type": "file",
  "status": "SUCCESS",
  "result": "Success. New document id 219 created",
  "acknowledged": false,
  "related_document": "219"
}
""".data(using: .utf8)!
    
    
    let decoder = JSONDecoder()
    decoder.dateDecodingStrategy = .paperlessDateFormat
    let task = try decoder.decode(PaperlessAPI.Task.self, from: json)
    
    #expect(task.id == 340)
    #expect(task.taskId == UUID(uuidString: "697a1e14-16e9-4963-9641-e298cc49cdf5")!)
    #expect(task.taskFileName == "Example_Document.pdf")
    #expect(task.dateCreated == Date(timeIntervalSince1970: 1734017091.692))
    #expect(task.dateDone == Date(timeIntervalSince1970: 1734017096.996))
    #expect(task.type == .file)
    #expect(task.status == .success)
    #expect(task.result == "Success. New document id 219 created")
    #expect(task.acknowledged == false)
    #expect(task.relatedDocument == "219")
}

