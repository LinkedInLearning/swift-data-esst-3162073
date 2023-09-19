//
//  BookCreationSheet.swift
//  TS BookClub
//
//  Created by Thomas Sillmann on 01.09.23.
//

import SwiftData
import SwiftUI

struct BookCreationSheet: View {
    @State private var title = ""
    
    @State private var content = ""
    
    @State private var newAuthorName = ""
    
    @State private var author: Author?
    
    @Binding var showSheet: Bool
    
    @Query private var authors: [Author]
    
    @Environment(\.modelContext) private var modelContext
    
    var body: some View {
        NavigationStack {
            Form {
                bookSection
                authorSection
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("New book")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    cancelButton
                }
                ToolbarItem(placement: .topBarTrailing) {
                    saveButton
                }
            }
        }
    }
    
    private var bookSection: some View {
        Section {
            TextField("Title", text: $title)
            TextField("Description", text: $content, axis: .vertical)
                .lineLimit(10...10)
        } header: {
            Text("Book")
        }
    }
    
    @ViewBuilder private var authorSection: some View {
        Section {
            HStack {
                TextField("New author", text: $newAuthorName)
                if !newAuthorName.isEmpty {
                    Spacer()
                    Image(systemName: "checkmark")
                }
            }
        }  header: {
            Text("Author")
        }
        Section {
            ForEach(authors) { author in
                Button(action: {
                    self.author = author
                    newAuthorName = ""
                }, label: {
                    HStack {
                        Text(author.name)
                        if self.author == author {
                            Spacer()
                            Image(systemName: "checkmark")
                        }
                    }
                })
                .tint(.primary)
            }
        }
        .onChange(of: newAuthorName) { _, newValue in
            if !newValue.isEmpty {
                author = nil
            }
        }
    }
    
    private var saveButton: some View {
        Button("Save") {
            if author == nil && !newAuthorName.isEmpty {
                author = Author(name: newAuthorName, isFavorite: false)
            }
            let book = Book(title: title, content: content, rating: .none, author: author)
            modelContext.insert(book)
            showSheet = false
        }
        .bold()
    }
    
    private var cancelButton: some View {
        Button("Cancel") {
            showSheet = false
        }
    }
}
