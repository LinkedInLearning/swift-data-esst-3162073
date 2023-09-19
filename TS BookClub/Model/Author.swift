//
//  Author.swift
//  TS BookClub
//
//  Created by Thomas Sillmann on 07.09.23.
//

import Foundation
import SwiftData

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
