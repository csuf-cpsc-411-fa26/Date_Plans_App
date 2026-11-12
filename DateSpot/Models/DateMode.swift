//
//  DateMode.swift
//  DateSpot
//
//  Created by Yair Diaz on 10/22/26.
//

import Foundation

enum DateMode: String, CaseIterable, Identifiable {
    case couple = "Couple Date"
    case solo = "Solo Date"
    
    var id: String {
        rawValue
    }
}
