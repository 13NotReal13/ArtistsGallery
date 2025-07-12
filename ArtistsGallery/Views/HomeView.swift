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
            SearchBarView()
            
            ArtistsListView()
        }
        .environmentObject(viewModel)
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
