//
//  Book.swift
//  TS BookClub
//
//  Created by Thomas Sillmann on 01.09.23.
//

import Foundation
import SwiftData

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
