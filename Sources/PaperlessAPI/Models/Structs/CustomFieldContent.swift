//
//  CustomFieldContent.swift
//  PaperlessAPI
//
//  Created by Leo Wehrfritz on 13.12.24.
//

public struct CustomFieldContent: Codable, Equatable, Hashable, Sendable {
    public var value: CustomFieldValue
    public let field: Int
    
    public init(value: CustomFieldValue, field: Int) {
        self.value = value
        self.field = field
    }
}
