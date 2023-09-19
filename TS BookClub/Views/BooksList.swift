//
//  BooksList.swift
//  TS BookClub
//
//  Created by Thomas Sillmann on 01.09.23.
//

import SwiftUI

struct BooksList: View {
    @State private var searchText = ""
    
    @State private var showBookCreationSheet = false
    
    var body: some View {
        NavigationStack {
            List {
                SearchableBooksView(searchString: searchText)
            }
            .fullScreenCover(isPresented: $showBookCreationSheet) {
                BookCreationSheet(showSheet: $showBookCreationSheet)
            }
            .navigationTitle("Books")
            .searchable(text: $searchText)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    createBookButton
                }
            }
        }
    }
    
    private var createBookButton: some View {
        Button(action: {
            showBookCreationSheet = true
        }, label: {
            Label("Add book", systemImage: "plus")
        })
    }
}

struct SearchableBooksView: View {
    private let searchString: String
    
    private var books: [Book] {
        dataManager.books(searchString: searchString)
    }
    
    @EnvironmentObject private var dataManager: DataManager
    
    var body: some View {
        ForEach(books, id: \.title) { book in
            NavigationLink {
                BookDetailView(book: book)
            } label: {
                VStack(alignment: .leading, spacing: 10) {
                    Text(book.title)
                        .font(.headline)
                    Text(book.author?.name ?? "-")
                        .italic()
                    if let lastViewed = book.lastViewed {
                        Text("Last viewed: \(lastViewed)")
                            .font(.caption2)
                    }
                }
            }
        }
        .onDelete(perform: { indexSet in
            deleteBook(indexSet: indexSet)
        })
    }
    
    init(searchString: String) {
        self.searchString = searchString
    }
    
    private func deleteBook(indexSet: IndexSet) {
        for index in indexSet {
            let book = books[index]
            dataManager.deleteBook(book)
        }
    }
}
