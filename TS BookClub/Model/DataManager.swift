//
//  DataManager.swift
//  TS BookClub
//
//  Created by Thomas Sillmann on 19.09.23.
//

import Foundation
import SwiftData

class DataManager: ObservableObject {
    private let schema = Schema([Author.self, Book.self])
    
    private let modelContainer: ModelContainer
    
    @MainActor private var modelContext: ModelContext {
        modelContainer.mainContext
    }
    
    init() {
        do {
            modelContainer = try ModelContainer(for: schema)
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }
    
    @MainActor func books(searchString: String = "") -> [Book] {
        let booksPredicate = #Predicate<Book> {
            searchString.isEmpty ? true : $0.title.contains(searchString)
        }
        let bookFetchDescriptor = FetchDescriptor<Book>(predicate: booksPredicate, sortBy: [SortDescriptor(\Book.title)])
        if let books = try? modelContext.fetch(bookFetchDescriptor) {
            return books
        }
        return []
    }
    
    @MainActor func createBook(title: String, content: String?, rating: Rating, author: Author?) {
        let book = Book(title: title, content: content, rating: rating, author: author)
        modelContext.insert(book)
        objectWillChange.send()
    }
}
