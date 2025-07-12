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
    @Published var searchText: String = "" {
        didSet { filterArtists() }
    }
    @Published var filteredArtists: [Artist] = []
    
    var isLoading = true
    
    private let apiService = APIService.shared
    private var errorMessage: String?
    
    func getArtistList() async {
        guard isLoading else { return }
        
        do {
            artistList = try await apiService.fetchArtistList().artists
            filteredArtists = artistList
        } catch {
            errorMessage = error.localizedDescription
        }
        
        isLoading = false
    }
    
    private func filterArtists() {
        let clearText = searchText.trimmingCharacters(in: .whitespacesAndNewlines).lowercased()
        
        guard !clearText.isEmpty else {
            filteredArtists = artistList
            return
        }
        
        filteredArtists = artistList.filter { artist in
            artist.name.lowercased().contains(clearText) ||
            artist.bio.lowercased().contains(clearText) ||
            artist.works.contains { work in
                work.title.lowercased().contains(clearText)
            }
        }
    }
}
