//
//  Rating.swift
//  TS BookClub
//
//  Created by Thomas Sillmann on 08.09.23.
//

import Foundation

enum Rating: Int, Codable, Identifiable {
    case none
    case oneStar
    case twoStars
    case threeStars
    case fourStars
    case fiveStars
    
    static let ratingValues: [Rating] = [.oneStar, .twoStars, .threeStars, .fourStars, .fiveStars]
    
    var id: Int {
        rawValue
    }
    
    func isSelected(in rating: Rating) -> Bool {
        rating.rawValue >= self.rawValue
    }
}
