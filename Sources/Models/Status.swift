//
//  Status.swift
//  PaperlessAPI
//
//  Created by Leo Wehrfritz on 14.12.24.
//

import Foundation

struct Status: Codable {
    let pngxVersion: String
    let serverOs: String
    let installType: String
    let storage: StatusStorage
    let database: StatusDatabase
    let tasks: StatusTasks
    
    enum CodingKeys: String, CodingKey {
        case pngxVersion = "pngx_version"
        case serverOs = "server_os"
        case installType = "install_type"
        case storage
        case database
        case tasks
    }
}

struct StatusStorage: Codable {
    let total: Int
    let available: Int
}

struct StatusDatabase: Codable {
    let type: String
    let url: String
    let status: String
    let error: String?
    let migrationStatus: StatusDatabaseMigrationStatus
    
    enum CodingKeys: String, CodingKey {
        case type
        case url
        case status
        case error
        case migrationStatus = "migration_status"
    }
}

struct StatusDatabaseMigrationStatus: Codable {
    let latestMigration: String
    let unappliedMigrations: [String]
    
    enum CodingKeys: String, CodingKey {
        case latestMigration = "latest_migration"
        case unappliedMigrations = "unapplied_migrations"
    }
}

struct StatusTasks: Codable {
    let redisUrl: String
    let redisStatus: String
    let redisError: String?
    let celeryStatus: String
    let indexStatus: String
    let indexLastModified: Date
    let indexError: String?
    let classifierStatus: String
    let classifierLastTrained: Date
    let classifierError: String?
    
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
