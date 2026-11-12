//
//  Place.swift
//  DateSpot
//
//  Created by Yair Diaz on 10/22/26.
//

import Foundation

struct Place: Identifiable, Codable, Hashable {
    let id: String
    let name: String
    let category: PlaceCategory
    let address: String
    let rating: Double?
    let priceLevel: Int?
    let description: String
    let isRated: Bool
    
}
