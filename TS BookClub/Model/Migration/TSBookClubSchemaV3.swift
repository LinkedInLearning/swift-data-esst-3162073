//
//  TSBookClubSchemaV3.swift
//  TS BookClub
//
//  Created by Thomas Sillmann on 20.09.23.
//

import Foundation
import SwiftData

enum TSBookClubSchemaV3: VersionedSchema {
    static var models: [any PersistentModel.Type] {
        [Author.self, Book.self]
    }
    
    static var versionIdentifier = Schema.Version(1, 1, 1)
    
    @Model
    class Author {
        @Attribute(.unique)
        var name: String
        
        var isFavorite: Bool
        
        @Relationship(deleteRule: .cascade, inverse: \Book.author)
        var books: [Book] = []
        
        init(name: String, isFavorite: Bool) {
            self.name = name
            self.isFavorite = isFavorite
        }
    }
    
    @Model
    class Book {
        var title: String
        
        @Attribute(originalName: "contentDescription")
        var content: String?
        
        var rating: Rating
        
        var author: Author?
        
        @Transient
        var lastViewed: Date?
        
        init(title: String, content: String? = nil, rating: Rating = .none, author: Author?) {
            self.title = title
            self.content = content
            self.rating = rating
            self.author = author
        }
    }
}
