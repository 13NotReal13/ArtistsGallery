//
//  HomeView.swift
//  ArtistsGallery
//
//  Created by Иван Семикин on 07/07/2025.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject private var coordinator: Coordinator
    @StateObject private var viewModel = HomeViewModel()
    
    var body: some View {
        VStack {
            SearchBarView(searchText: $viewModel.searchText)
            
            ScrollView(.vertical) {
                ForEach(viewModel.artistList, id:\.name) { artist in
                    ArtistCardView(artist: artist)
                        .onTapGesture {
                            coordinator.push(.artistDetail(artist))
                        }
                }
            }
            .padding(.horizontal)
            .scrollIndicators(.hidden)
            .overlay {
                if viewModel.isLoading {
                    ProgressView()
                }
            }
        }
        .toolbarTitleDisplayMode(.inlineLarge)
        .navigationTitle("Artists")
        .task {
            await viewModel.getArtistList()
        }
    }
}

#Preview {
    NavigationStack {
        HomeView()
    }
}
