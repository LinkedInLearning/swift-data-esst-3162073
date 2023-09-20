//
//  TSBookClubMigrationPlan.swift
//  TS BookClub
//
//  Created by Thomas Sillmann on 20.09.23.
//

import Foundation
import SwiftData

enum TSBookClubMigrationPlan: SchemaMigrationPlan {
    static var schemas: [any VersionedSchema.Type] {
            [TSBookClubSchemaV1.self, TSBookClubSchemaV2.self, TSBookClubSchemaV3.self]
        }
        
        static var stages: [MigrationStage] {
            [migrateV1toV2, migrateV2toV3]
        }
        
        static let migrateV1toV2 = MigrationStage.custom(
            fromVersion: TSBookClubSchemaV1.self,
            toVersion: TSBookClubSchemaV2.self,
            willMigrate: { context in
                handleAuthorDuplicates(in: context)
                try? context.save()
            },
            didMigrate: nil
        )
        
        static let migrateV2toV3 = MigrationStage.lightweight(fromVersion: TSBookClubSchemaV2.self, toVersion: TSBookClubSchemaV3.self)
}

extension TSBookClubMigrationPlan {
    private static func handleAuthorDuplicates(in context: ModelContext) {
        moveBooksFromDuplicates(in: context)
        deleteDuplicates(in: context)
    }
    
    private static func moveBooksFromDuplicates(in context: ModelContext) {
        handleAuthorDuplicates(in: context) {
            $0.books.append(contentsOf: $1.books)
        }
    }
    
    private static func deleteDuplicates(in context: ModelContext) {
        handleAuthorDuplicates(in: context) {
            if $1.books.isEmpty {
                context.delete($1)
            }
        }
    }
    
    private static func handleAuthorDuplicates(in context: ModelContext, duplicateAction: (TSBookClubSchemaV1.Author, TSBookClubSchemaV1.Author) -> Void) {
        if let authors = try? context.fetch(FetchDescriptor<TSBookClubSchemaV1.Author>()) {
            for author in authors {
                let duplicateAuthors = authors.filter { $0 != author && $0.name == author.name }
                for duplicateAuthor in duplicateAuthors {
                    duplicateAction(author, duplicateAuthor)
                }
            }
        }
    }
}
