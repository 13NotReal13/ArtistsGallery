//
//  HomeView.swift
//  ArtistsGallery
//
//  Created by Иван Семикин on 07/07/2025.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = HomeViewModel()
    
    var body: some View {
        VStack {
            SearchBarView(searchText: $viewModel.searchText)
            
            ScrollView(.vertical) {
                ForEach(viewModel.artistList, id:\.name) { artist in
                    ArtistCardView(artist: artist)
                }
            }
            .ignoresSafeArea()
            .padding(.horizontal)
            .scrollIndicators(.hidden)
            .overlay {
                if viewModel.isLoading {
                    ProgressView()
                }
            }
        }
        .task {
            await viewModel.getArtistList()
        }
    }
}

#Preview {
    HomeView()
}
