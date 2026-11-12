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
                    VStack(alignment: .center, spacing: 8) {
                        Text("DateSpot")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                        
                        Text("Discover your next adventure!")
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                    }
                    .frame(maxWidth: .infinity)
                    .multilineTextAlignment(.center)
                    
                    VStack(alignment: .center, spacing: 12){
                        Text("Who are you going with?")
                            .font(.headline)
                        
                        Picker("Date Mode", selection: $selectedMode) {
                            ForEach(DateMode.allCases) {
                                mode in
                                Text(mode.rawValue)
                                    .tag(mode)
                            }
                            
                        }
                        
                        .pickerStyle(.segmented)
                    }
                    
                    Text("Explore Categories")
                        .font(.title2)
                        .fontWeight(.bold)
                    
                    ForEach(PlaceCategory.allCases) {
                        category in
                        NavigationLink {
                            CategoryDetailView(
                                category: category,
                                mode: selectedMode
                            )
                            
                        } label: {
                            HStack(spacing: 16) {
                                Image(systemName: category.icon)
                                    .font(.title2)
                                    .frame(width: 45)
                                
                                Text(category.rawValue)
                                    .font(.headline)
                                
                                Spacer()
                                
                                Image(systemName: "chevron.right")
                            }
                            
                            .padding()
                            .background(
                                Color(.secondarySystemBackground)
                            )
                            .clipShape(
                            RoundedRectangle(cornerRadius: 14)
                            )
                        }
                        .buttonStyle(.plain)
                    }
                }
                .padding()
            }
        }
    }
}

struct CategoryDetailView: View {
    
    let category: PlaceCategory
    let mode: DateMode
    
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: category.icon)
                .font(.system(size:60))
                .foregroundStyle(.tint)
            
            Text(category.rawValue)
                    .font(.largeTitle)
                    .fontWeight(.bold)
            
            Text(
                mode == .couple
                ? "Find great places for two!"
                : "Discover something fun for yourself"
            )
            .foregroundStyle(.secondary)
            
            Spacer()
        
        }
        .padding()
        .navigationTitle(category.rawValue)
    }
    
}

#Preview {
    Homeview()
}
