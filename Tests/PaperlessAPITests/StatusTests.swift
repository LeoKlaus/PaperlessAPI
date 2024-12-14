//
//  StatusTests.swift
//  PaperlessAPI
//
//  Created by Leo Wehrfritz on 14.12.24.
//

import Testing
import Foundation
@testable import PaperlessAPI

@Test func decodeStatus() async throws {
    
    let json = """
{
  "pngx_version": "2.11.6",
  "server_os": "Linux-5.15.0-1046-oracle-aarch64-with-glibc2.36",
  "install_type": "docker",
  "storage": {
    "total": 48277495808,
    "available": 17233395712
  },
  "database": {
    "type": "sqlite",
    "url": "/usr/src/paperless/data/db.sqlite3",
    "status": "OK",
    "error": null,
    "migration_status": {
      "latest_migration": "paperless_mail.0011_remove_mailrule_assign_tag_squashed_0024_alter_mailrule_name_and_more",
      "unapplied_migrations": []
    }
  },
  "tasks": {
    "redis_url": "redis://broker:6379",
    "redis_status": "OK",
    "redis_error": null,
    "celery_status": "OK",
    "index_status": "OK",
    "index_last_modified": "2024-12-14T00:00:00.813984+01:00",
    "index_error": null,
    "classifier_status": "OK",
    "classifier_last_trained": "2024-12-14T20:05:00.163431Z",
    "classifier_error": null
  }
}
""".data(using: .utf8)!
    
    
    let decoder = JSONDecoder()
    decoder.dateDecodingStrategy = .paperlessDateFormat
    let status = try decoder.decode(Status.self, from: json)
    
    #expect(status.pngxVersion == "2.11.6")
    #expect(status.serverOs == "Linux-5.15.0-1046-oracle-aarch64-with-glibc2.36")
    #expect(status.installType == "docker")
    #expect(status.storage.total == 48277495808)
    #expect(status.storage.available == 17233395712)
    #expect(status.database.type == "sqlite")
    #expect(status.database.url == "/usr/src/paperless/data/db.sqlite3")
    #expect(status.database.status == "OK")
    #expect(status.database.error == nil)
    #expect(status.database.migrationStatus.latestMigration == "paperless_mail.0011_remove_mailrule_assign_tag_squashed_0024_alter_mailrule_name_and_more")
    #expect(status.database.migrationStatus.unappliedMigrations.isEmpty)
    #expect(status.tasks.redisUrl == "redis://broker:6379")
    #expect(status.tasks.redisStatus == "OK")
    #expect(status.tasks.redisError == nil)
    #expect(status.tasks.celeryStatus == "OK")
    #expect(status.tasks.indexStatus == "OK")
    #expect(status.tasks.indexLastModified == Date(timeIntervalSince1970: 1734130800.813))
    #expect(status.tasks.indexError == nil)
    #expect(status.tasks.classifierStatus == "OK")
    #expect(status.tasks.classifierLastTrained == Date(timeIntervalSince1970: 1734206700.163))
    #expect(status.tasks.classifierError == nil)
}
