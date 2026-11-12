//
//  Homeview.swift
//  DateSpot
//
//  Created by Yair Diaz on 10/22/26.
//

import SwiftUI

struct Homeview: View {
    
    @State private var selectedMode: DateMode = .couple
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("DateSpot")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                        
                        Text("Discover your next adventure!")
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                    }
                    
                    VStack(alignment: .leading, spacing: 12){
                        Text("Who are you going with?")
                            .font(.headline)
                        
                        Picker("Date Mode", selection: $selectedMode) {
                            
                        }
                    }
                }
            }
        }
    }
}
