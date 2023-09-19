//
//  RatingView.swift
//  TS BookClub
//
//  Created by Thomas Sillmann on 08.09.23.
//

import SwiftUI

struct RatingView: View {
    @Binding var rating: Rating
    
    var body: some View {
        HStack {
            ForEach(Rating.ratingValues) { rating in
                RatingButton(rating: $rating, ratingValue: rating)
            }
        }
    }
}

struct RatingButton: View {
    @Binding var rating: Rating
    
    let ratingValue: Rating
    
    var body: some View {
        Button {
            rating = ratingValue
        } label: {
            Image(systemName: ratingValue.isSelected(in: rating) ? "star.fill" : "star")
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    RatingView(rating: .constant(.fourStars))
}
