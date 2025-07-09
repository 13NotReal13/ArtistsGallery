//
//  APIService.swift
//  ArtistsGallery
//
//  Created by Иван Семикин on 09/07/2025.
//

import Foundation

final class APIService {
    private let urlString = "https://cdn.accelonline.io/OUR6G_IgJkCvBg5qurB2Ag/files/YPHn3cnKEk2NutI6fHK04Q.json"
    
    func fetchArtistList() async throws -> ArtistList {
        guard let url = URL(string: urlString) else {
            throw URLError(.badURL)
        }
        
        let (data, _ ) = try await URLSession.shared.data(from: url)
        let artistList = try JSONDecoder().decode(ArtistList.self, from: data)
        
        return artistList
    }
}
