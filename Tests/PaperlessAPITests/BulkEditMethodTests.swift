//
//  BulkEditMethodTests.swift
//  PaperlessAPI
//
//  Created by Leo Wehrfritz on 04.02.25.
//

import Testing
import Foundation
import SwiftUI
@testable import PaperlessAPI

@Test func encodeBulkEditMethodCorrespondent() async throws {
    let method = BulkEditMethod.setCorrespondent(id: 4)
    
    let encoded = try method.requestBody(for: [2])
    
    let serialized = try JSONSerialization.jsonObject(with: encoded) as? [String:Any]
    
    #expect(serialized?["documents"] as? [Int] == [2])
    #expect(serialized?["method"] as? String == "set_correspondent")
    #expect(serialized?["parameters"] as? [String:Int] == ["correspondent": 4])
}

@Test func encodeBulkEditMethodDocumentType() async throws {
    let method = BulkEditMethod.setDocumentType(id: 3)
    
    let encoded = try method.requestBody(for: [2])
    
    let serialized = try JSONSerialization.jsonObject(with: encoded) as? [String:Any]
    
    #expect(serialized?["method"] as? String == "set_document_type")
    #expect(serialized?["parameters"] as? [String:Int] == ["document_type": 3])
}

@Test func encodeBulkEditMethodStoragePath() async throws {
    let method = BulkEditMethod.setStoragePath(id: 4)
    
    let encoded = try method.requestBody(for: [2])
    
    let serialized = try JSONSerialization.jsonObject(with: encoded) as? [String:Any]
    
    #expect(serialized?["method"] as? String == "set_storage_path")
    #expect(serialized?["parameters"] as? [String:Int] == ["storage_path": 4])
}

@Test func encodeBulkEditMethodAddTag() async throws {
    let method = BulkEditMethod.addTag(id: 4)
    
    let encoded = try method.requestBody(for: [2])
    
    let serialized = try JSONSerialization.jsonObject(with: encoded) as? [String:Any]
    
    #expect(serialized?["method"] as? String == "add_tag")
    #expect(serialized?["parameters"] as? [String:Int] == ["tag": 4])
}

@Test func encodeBulkEditMethodRemoveTag() async throws {
    let method = BulkEditMethod.removeTag(id: 4)
    
    let encoded = try method.requestBody(for: [2])
    
    let serialized = try JSONSerialization.jsonObject(with: encoded) as? [String:Any]
    
    #expect(serialized?["method"] as? String == "remove_tag")
    #expect(serialized?["parameters"] as? [String:Int] == ["tag": 4])
}

@Test func encodeBulkEditMethodModifyTags() async throws {
    let method = BulkEditMethod.modifyTags(add: [4], remove: [5, 6])
    
    let encoded = try method.requestBody(for: [2])
    
    let serialized = try JSONSerialization.jsonObject(with: encoded) as? [String:Any]
    
    #expect(serialized?["method"] as? String == "modify_tags")
    #expect(serialized?["parameters"] as? [String:[Int]] == ["add_tags": [4], "remove_tags": [5, 6]])
}

@Test func encodeBulkEditMethodDelete() async throws {
    let method = BulkEditMethod.delete
    
    let encoded = try method.requestBody(for: [2])
    
    let serialized = try JSONSerialization.jsonObject(with: encoded) as? [String:Any]
    
    #expect(serialized?["method"] as? String == "delete")
}

@Test func encodeBulkEditMethodReprocess() async throws {
    let method = BulkEditMethod.reprocess
    
    let encoded = try method.requestBody(for: [2])
    
    let serialized = try JSONSerialization.jsonObject(with: encoded) as? [String:Any]
    
    #expect(serialized?["method"] as? String == "reprocess")
}

@Test func encodeBulkEditMethodSetPermissions() async throws {
    let method = BulkEditMethod.setPermissions(
        permissions: ObjectPermissions(
            view: ObjectPermission(
                users: [1],
                groups: [2,3]
            ),
            change: ObjectPermission(
                users: [],
                groups: [5]
            )
        ),
        owner: 4,
        merge: true
    )
    
    let encoded = try method.requestBody(for: [2])
    
    let serialized = try JSONSerialization.jsonObject(with: encoded) as? [String:Any]
    
    #expect(serialized?["method"] as? String == "set_permissions")
    let parameters = serialized?["parameters"] as? [String:Any]
    
    #expect(parameters?["set_permissions"] as? [String:[String:[Int]]] == [
        "view": [
            "users": [1],
            "groups": [2, 3]
        ],
        "change": [
            "users": [],
            "groups": [5]
        ]
    ])
    
    #expect(parameters?["owner"] as? Int == 4)
    #expect(parameters?["merge"] as? Bool ?? false)
}

@Test func encodeBulkEditMethodMerge() async throws {
    let method = BulkEditMethod.merge(metadataDocId: 4, deleteOriginals: true)
    
    let encoded = try method.requestBody(for: [2])
    
    let serialized = try JSONSerialization.jsonObject(with: encoded) as? [String:Any]
    
    #expect(serialized?["method"] as? String == "merge")
    let parameters = serialized?["parameters"] as? [String:Any]
    
    #expect(parameters?["metadata_document_id"] as? Int == 4)
    #expect(parameters?["delete_originals"] as? Bool ?? false)
}

@Test func encodeBulkEditMethodSplit() async throws {
    let method = BulkEditMethod.split(pages: ["2", "3-5"], deleteOriginals: true)
    
    let encoded = try method.requestBody(for: [2])
    
    let serialized = try JSONSerialization.jsonObject(with: encoded) as? [String:Any]
    
    #expect(serialized?["method"] as? String == "split")
    let parameters = serialized?["parameters"] as? [String:Any]
    
    #expect(parameters?["pages"] as? [String] == ["2", "3-5"])
    #expect(parameters?["delete_originals"] as? Bool ?? false)
}

@Test func encodeBulkEditMethodRotate() async throws {
    let method = BulkEditMethod.rotate(degrees: 90)
    
    let encoded = try method.requestBody(for: [2])
    
    let serialized = try JSONSerialization.jsonObject(with: encoded) as? [String:Any]
    
    #expect(serialized?["method"] as? String == "rotate")
    let parameters = serialized?["parameters"] as? [String:Any]
    
    #expect(parameters?["degrees"] as? Int == 90)
}

@Test func encodeBulkEditMethodDeletePages() async throws {
    let method = BulkEditMethod.deletePages(pages: [2, 4])
    
    let encoded = try method.requestBody(for: [2])
    
    let serialized = try JSONSerialization.jsonObject(with: encoded) as? [String:Any]
    
    #expect(serialized?["method"] as? String == "delete_pages")
    let parameters = serialized?["parameters"] as? [String:Any]
    
    #expect(parameters?["pages"] as? [Int] == [2, 4])
}

@Test func encodeBulkEditMethodModifyCustomFields() async throws {
    let method = BulkEditMethod.modifyCustomFields(
        addCustomFields: [
            2: .monetary(6.2, "EUR")
        ],
        removeCustomFields: [3]
    )
    
    let encoded = try method.requestBody(for: [2])
    
    let serialized = try JSONSerialization.jsonObject(with: encoded) as? [String:Any]
    
    #expect(serialized?["method"] as? String == "modify_custom_fields")
    let parameters = serialized?["parameters"] as? [String:Any]
    
    #expect(parameters?["add_custom_fields"] as? [String:String] == ["2": "EUR6.20"])
    #expect(parameters?["remove_custom_fields"] as? [Int] == [3])
}

@Test func encodeBulkEditMethodModifyCustomFieldsNil() async throws {
    let method = BulkEditMethod.modifyCustomFields(
        addCustomFields: [
            2: nil
        ],
        removeCustomFields: [3]
    )
    
    let encoded = try method.requestBody(for: [2])
    
    let serialized = try JSONSerialization.jsonObject(with: encoded) as? [String:Any]
    
    #expect(serialized?["method"] as? String == "modify_custom_fields")
    let parameters = serialized?["parameters"] as? [String:Any]
    
    #expect(parameters?["add_custom_fields"] as? [String:String?] == ["2": nil])
    #expect(parameters?["remove_custom_fields"] as? [Int] == [3])
}
