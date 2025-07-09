//
//  HomeView.swift
//  ArtistsGallery
//
//  Created by Иван Семикин on 07/07/2025.
//

import SwiftUI

struct HomeView: View {
    @State private var searchText: String = ""
    let artists: [ArtistTest] = (0...10).map { _ in ArtistTest() }
    
    var body: some View {
        VStack {
            SearchBarView(searchText: $searchText)
            
            ScrollView(.vertical) {
                ForEach(artists, id: \.name) { artist in
                    ArtistCardView(artist: artist)
                }
            }
            .ignoresSafeArea()
            .scrollIndicators(.hidden)
        }
    }
}

#Preview {
    HomeView()
}
