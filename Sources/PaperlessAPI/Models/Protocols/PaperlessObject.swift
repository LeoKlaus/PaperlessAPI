//
//  PaperlessObject.swift
//  PaperlessAPI
//
//  Created by Leo Wehrfritz on 14.12.24.
//

public protocol PaperlessObject: Codable {
    var id: Int { get }
}
