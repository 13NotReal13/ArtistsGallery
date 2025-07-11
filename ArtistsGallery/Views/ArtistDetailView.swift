//
//  ArtistDetailView.swift
//  ArtistsGallery
//
//  Created by Иван Семикин on 11/07/2025.
//

import SwiftUI

struct ArtistDetailView: View {
    let artist: Artist
    
    var body: some View {
        ScrollView {
            Image(artist.image)
                .resizable()
                .scaledToFill()
                .frame(height: 384)
                .clipped()
                .overlay {
                    VStack(alignment: .leading) {
                        Spacer()
                        
                        Text(artist.name)
                            .font(.system(size: 16, weight: .semibold))
                            .foregroundStyle(.white)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Text("Author")
                            .font(.system(size: 14))
                            .foregroundStyle(Color(UIColor.lightGray))
                    }
                    .padding()
                }
            
            VStack(alignment: .leading, spacing: 16) {
                Text("Biography")
                    .fontWeight(.semibold)
                
                Text(artist.bio)
                    .foregroundStyle(.gray)
            }
            .padding()
            
            VStack(alignment: .leading) {
                Text("Works")
                    .fontWeight(.semibold)
                
                ScrollView {
                    ForEach(artist.works, id:\.title) { work in
                        VStack(alignment: .leading) {
                            Image(work.image)
                                .resizable()
                                .clipShape(.rect(cornerRadius: 12))
                            
                            Text(work.title)
                        }
                    }
                }
            }
            .padding(.horizontal)
            
            Spacer()
        }
        .ignoresSafeArea()
    }
}

#Preview {
    let mockArtist = Artist(
        name: "Pablo Picasso",
        bio: "Pablo Ruiz y Picasso (25 October 1881 – 8 April 1973), also known as Pablo Picasso, was a Spanish painter, sculptor, printmaker, ceramicist, stage designer, poet and playwright who spent most of his adult life in France.",
        image: "0",
        works: [
            Work(title: "Some title work", image: "Picasso1", info: "Some info")
        ]
    )
    
    ArtistDetailView(artist: mockArtist)
}
