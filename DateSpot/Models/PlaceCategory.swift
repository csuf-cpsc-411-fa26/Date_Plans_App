//
//  PlaceCategory.swift
//  DateSpot
//
//  Created by Yair Diaz on 10/22/26.
//

import Foundation

enum PlaceCategory: String, CaseIterable, Identifiable, Codable {
    case restaurant = "Restaurants"
    case cafe = "Cafes"
    case activities = "Activities"
    case outdoors = "Outdoor Spots"
    case entertainment = "Entertainment"
    
    var id: String {
        rawValue
    }
    
    var icon: String {
        switch self {
        case .restaurant:
            return "fork.knife"
        case .cafe:
            return "cup.and.saucer"
        case .activities:
            return "figure.walk"
        case .outdoors:
            return "leaf"
        case .entertainment:
            return "film"
        }
    }
}
