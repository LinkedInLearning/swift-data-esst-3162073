//
//  AuthorsList.swift
//  TS BookClub
//
//  Created by Thomas Sillmann on 15.09.23.
//

import SwiftData
import SwiftUI

struct AuthorsList: View {
    @State private var showOnlyFavorites = false
    
    var body: some View {
        NavigationStack {
            List {
                FilteredAuthorsView(showOnlyFavorites: showOnlyFavorites)
            }
            .navigationTitle("Authors")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        showOnlyFavorites.toggle()
                    } label: {
                        Image(systemName: showOnlyFavorites ? "heart.fill" : "heart")
                    }
                }
            }
        }
    }
}

struct FilteredAuthorsView: View {
    @Query(sort: [SortDescriptor(\Author.name)]) private var authors: [Author]
    
    @Environment(\.modelContext) private var modelContext
    
    var body: some View {
        Section {
            ForEach(authors, id: \.name) { author in
                DisclosureGroup {
                    ForEach(author.books, id: \.title) { book in
                        NavigationLink(book.title, destination: BookDetailView(book: book))
                    }
                    .onDelete(perform: { indexSet in
                        deleteBook(from: author, indexSet: indexSet)
                    })
                } label: {
                    HStack {
                        Button {
                            author.isFavorite.toggle()
                        } label: {
                            Image(systemName: author.isFavorite ? "heart.fill" : "heart")
                                .foregroundColor(.red)
                        }
                        .buttonStyle(.plain)
                        Text(author.name)
                    }
                }
            }
            .onDelete(perform: { indexSet in
                deleteAuthor(indexSet: indexSet)
            })
        }
    }
    
    init(showOnlyFavorites: Bool = false) {
        if showOnlyFavorites {
            _authors = Query(filter: #Predicate<Author> {
                $0.isFavorite
            })
        }
    }
    
    private func deleteAuthor(indexSet: IndexSet) {
        for index in indexSet {
            let author = authors[index]
            modelContext.delete(author)
        }
    }
    
    private func deleteBook(from author: Author, indexSet: IndexSet) {
        for index in indexSet {
            let book = author.books[index]
            modelContext.delete(book)
        }
    }
}
