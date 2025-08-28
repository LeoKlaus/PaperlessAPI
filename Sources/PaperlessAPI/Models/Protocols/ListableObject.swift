//
//  ListableObject.swift
//  PaperlessAPI
//
//  Created by Leo Wehrfritz on 14.12.24.
//

public protocol ListableObject: Identifiable, Codable, Sendable {
    var id: Int { get }
}
