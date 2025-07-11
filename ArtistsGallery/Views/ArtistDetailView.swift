//
//  ArtistDetailView.swift
//  ArtistsGallery
//
//  Created by Иван Семикин on 11/07/2025.
//

import SwiftUI

struct ArtistDetailView: View {
    @EnvironmentObject private var coordinator: Coordinator
    let artist: Artist
    
    var body: some View {
        ScrollView {
            ArtistsImageView(artist: artist)
            
            VStack(alignment: .leading, spacing: 16) {
                Text("Biography")
                    .fontWeight(.semibold)
                
                Text(artist.bio)
                    .foregroundStyle(.gray)
            }
            .padding()
            
            WorksListView(works: artist.works)
            
            Spacer()
        }
        .ignoresSafeArea()
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button {
                    coordinator.pop()
                } label: {
                    Image(systemName: "arrow.left")
                        .foregroundStyle(.white)
                }
            }
        }
    }
}

#Preview {
    let mockArtist = Artist(
        name: "Pablo Picasso",
        bio: "Pablo Ruiz y Picasso (25 October 1881 – 8 April 1973), also known as Pablo Picasso, was a Spanish painter, sculptor, printmaker, ceramicist, stage designer, poet and playwright who spent most of his adult life in France.",
        image: "0",
        works: [
            Work(title: "Some title work", image: "Picasso1", info: "")
        ]
    )
    
    NavigationStack {
        ArtistDetailView(artist: mockArtist)
    }
}
