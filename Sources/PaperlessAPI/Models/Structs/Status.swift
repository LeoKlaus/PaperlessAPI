//
//  Status.swift
//  PaperlessAPI
//
//  Created by Leo Wehrfritz on 14.12.24.
//

import Foundation

public struct Status: Codable, Sendable {
    public let pngxVersion: String
    public let serverOs: String
    public let installType: String
    public let storage: StatusStorage
    public let database: StatusDatabase
    public let tasks: StatusTasks
    
    enum CodingKeys: String, CodingKey {
        case pngxVersion = "pngx_version"
        case serverOs = "server_os"
        case installType = "install_type"
        case storage
        case database
        case tasks
    }
}

public struct StatusStorage: Codable, Sendable {
    public let total: Int
    public let available: Int
}

public struct StatusDatabase: Codable, Sendable {
    public let type: String
    public let url: String
    public let status: String
    public let error: String?
    public let migrationStatus: StatusDatabaseMigrationStatus
    
    enum CodingKeys: String, CodingKey {
        case type
        case url
        case status
        case error
        case migrationStatus = "migration_status"
    }
}

public struct StatusDatabaseMigrationStatus: Codable, Sendable {
    public let latestMigration: String
    public let unappliedMigrations: [String]
    
    enum CodingKeys: String, CodingKey {
        case latestMigration = "latest_migration"
        case unappliedMigrations = "unapplied_migrations"
    }
}

public struct StatusTasks: Codable, Sendable {
    public let redisUrl: String
    public let redisStatus: String
    public let redisError: String?
    public let celeryStatus: String
    public let indexStatus: String
    public let indexLastModified: Date
    public let indexError: String?
    public let classifierStatus: String
    public let classifierLastTrained: Date
    public let classifierError: String?
    
    enum CodingKeys: String, CodingKey {
        case redisUrl = "redis_url"
        case redisStatus = "redis_status"
        case redisError = "redis_error"
        case celeryStatus = "celery_status"
        case indexStatus = "index_status"
        case indexLastModified = "index_last_modified"
        case indexError = "index_error"
        case classifierStatus = "classifier_status"
        case classifierLastTrained = "classifier_last_trained"
        case classifierError = "classifier_error"
    }
}
