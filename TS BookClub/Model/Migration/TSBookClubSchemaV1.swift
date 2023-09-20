//
//  TSBookClubSchemaV1.swift
//  TS BookClub
//
//  Created by Thomas Sillmann on 20.09.23.
//

import Foundation
import SwiftData

enum TSBookClubSchemaV1: VersionedSchema {
    static var models: [any PersistentModel.Type] {
        [Author.self, Book.self]
    }
    
    static var versionIdentifier = Schema.Version(1, 0, 0)
    
    @Model
    class Author {
        var name: String
        
        var isFavorite: Bool
        
        var books: [Book] = []
        
        init(name: String, isFavorite: Bool) {
            self.name = name
            self.isFavorite = isFavorite
        }
    }
    
    @Model
    class Book {
        var title: String
        
        var contentDescription: String?
        
        var rating: Rating
        
        var author: Author?
        
        var lastViewed: Date?
        
        init(title: String, content: String? = nil, rating: Rating = .none, author: Author?) {
            self.title = title
            self.contentDescription = content
            self.rating = rating
            self.author = author
        }
    }
}
