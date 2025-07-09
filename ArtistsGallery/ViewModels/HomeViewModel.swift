//
//  HomeViewModel.swift
//  ArtistsGallery
//
//  Created by Иван Семикин on 09/07/2025.
//

import Foundation

final class HomeViewModel: ObservableObject {
    @Published var artistList: [Artist] = []
    
    private let apiService = APIService.shared
    private var isLoading = true
    private var errorMessage: String?
    
    func getArtistList() async {
        guard !isLoading else { return }
        
        do {
            let artistList = try await apiService.fetchArtistList()
        } catch {
            errorMessage = error.localizedDescription
        }
        
        isLoading = false
    }
}
