//
//  PlaceAPIService.swift
//  DateSpot
//
//  Created by Yair Diaz on 10/22/26.
//

import Foundation

final class PlaceAPIService {
    
    private let baseURL = "https://overpass-api.de/api/interpreter"
    
    func fetchPlaces(latitude: Double, longitude: Double) async throws -> [Place] {
        
        let query = """
        [out:json][timeout:25];
        (
            node(around:1500,\(latitude),\(longitude))["amenity"~"restaurant|cafe"];
            
        );
        out body;
        """
        
        guard var components = URLComponents(string: baseURL) else {
            throw URLError(.badURL)
        }
        
        components.queryItems = [
            URLQueryItem(name: "data", value: query)
        ]
        
        guard let url = components.url else {
            throw URLError(.badURL)
        }
        
        var request = URLRequest(url:url)
        request.httpMethod = "GET"
        request.timeoutInterval = 30
        
        let (data, response) = try await URLSession.shared.data(for:request)
        
        guard let httpResponse = response as? HTTPURLResponse,
              (200...299).contains(httpResponse.statusCode) else {
            throw URLError(.badServerResponse)
        }
        
        let decodedResponse = try JSONDecoder().decode(
            OverpassResponse.self,
            from: data
        
        )
        
        return decodedResponse.elements.compactMap { element in
            
            guard let name = element.tags["name"],
                  let amenity = element.tags["amenity"] else {
                return nil
            }
            
            let category: PlaceCategory =
            amenity == "cafe" ? .cafe : .restaurant
            
            let houseNumber = element.tags["addr:housenumber"] ?? ""
            let street = element.tags["addr:street"] ?? ""
            let city = element.tags["addr:city"] ?? ""
            
            let addressParts = [houseNumber, street, city]
                .filter { !$0.isEmpty }
            
            let address = addressParts.isEmpty
                ? "Address not available"
            : addressParts.joined(seperator: " ")
            
            let cuisine = element.tags["cuisine"] ?? amenity
            
            return Place(
                id: String(element.id),
                name: name,
                category: category,
                address: address,
                rating: nil,
                priceLevel: nil,
                description: "Type: \(cuisine)"
            
        )
            
        }
    }
    
}

private struct OverpassResponse: Decodable {
    let elements: [OverpassElement]
}

private struct OverpassElement: Decodable {
    let id: Int
    let tags: [String: String]
}
