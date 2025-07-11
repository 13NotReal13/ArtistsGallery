//
//  HomeViewModel.swift
//  ArtistsGallery
//
//  Created by Иван Семикин on 09/07/2025.
//

import Foundation

@MainActor
final class HomeViewModel: ObservableObject {
    @Published var artistList: [Artist] = []
    @Published var searchText: String = ""
    
    var isLoading = true
    
    private let apiService = APIService.shared
    private var errorMessage: String?
    
    func getArtistList() async {
        guard isLoading else { return }
        
        do {
            artistList = try await apiService.fetchArtistList().artists
        } catch {
            errorMessage = error.localizedDescription
        }
        
        isLoading = false
    }
}
