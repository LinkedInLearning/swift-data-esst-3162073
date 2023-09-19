//
//  BookCreationSheet.swift
//  TS BookClub
//
//  Created by Thomas Sillmann on 01.09.23.
//

import SwiftUI

struct BookCreationSheet: View {
    @State private var title = ""
    
    @State private var content = ""
    
    @State private var newAuthorName = ""
    
    @Binding var showSheet: Bool
    
    @EnvironmentObject private var dataManager: DataManager
    
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
    }
    
    private var saveButton: some View {
        Button("Save") {
            let newAuthor = Author(name: newAuthorName, isFavorite: false)
            dataManager.createBook(title: title, content: content, rating: .none, author: newAuthor)
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
