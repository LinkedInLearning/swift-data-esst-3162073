//
//  BookDetailView.swift
//  TS BookClub
//
//  Created by Thomas Sillmann on 01.09.23.
//

import SwiftUI

struct BookDetailView: View {
    @Bindable var book: Book
    
    var body: some View {
        Form {
            Section {
                Text(book.title)
                    .bold()
                Text(book.author?.name ?? "-")
                    .italic()
            }
            if let content = book.content, !content.isEmpty {
                Section {
                    Text(content)
                }
            }
            Section {
                RatingView(rating: $book.rating)
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            book.lastViewed = Date()
        }
    }
}
