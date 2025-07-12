//
//  ArtistsListView.swift
//  ArtistsGallery
//
//  Created by Иван Семикин on 12/07/2025.
//

import SwiftUI

struct ArtistsListView: View {
    @EnvironmentObject private var coordinator: Coordinator
    @EnvironmentObject private var viewModel: HomeViewModel
    
    var body: some View {
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
}

#Preview {
    ArtistsListView()
        .environmentObject(HomeViewModel())
        .environmentObject(Coordinator())
}
