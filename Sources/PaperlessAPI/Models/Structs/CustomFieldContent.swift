//
//  CustomFieldContent.swift
//  PaperlessAPI
//
//  Created by Leo Wehrfritz on 13.12.24.
//

public struct CustomFieldContent: Codable, Equatable {
    let value: CustomFieldValue
    let field: Int
}
