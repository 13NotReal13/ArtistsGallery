//
//  HomeView.swift
//  ArtistsGallery
//
//  Created by Иван Семикин on 07/07/2025.
//

import SwiftUI

struct HomeView: View {
    @State private var searchText: String = ""
    let artists: [Artist] = (0...10).map { _ in Artist() }
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundStyle(.gray)
                
                TextField("Search", text: $searchText)
                    .autocorrectionDisabled()
            }
            .padding()
            .background {
                RoundedRectangle(cornerRadius: 15)
                    .foregroundStyle(.gray.opacity(0.1))
            }
            .padding()
            
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
