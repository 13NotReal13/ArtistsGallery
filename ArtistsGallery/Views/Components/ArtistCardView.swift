//
//  ArtistCardView.swift
//  ArtistsGallery
//
//  Created by Иван Семикин on 08/07/2025.
//

import SwiftUI

struct ArtistCardView: View {
    var artist: Artist
    
    var body: some View {
        HStack(spacing: 16) {
            Image(artist.image)
                .resizable()
                .scaledToFill()
                .frame(width: 96, height: 96)
                .clipShape(RoundedRectangle(cornerRadius: 12))
            
            VStack(alignment: .leading) {
                Spacer()
                
                Text(artist.name)
                    .foregroundStyle(.gray)
                
                Spacer()
                
                Text(artist.bio)
                    .lineLimit(2)
                    .fixedSize(horizontal: false, vertical: true)
                
                Spacer()
            }
        }
        .frame(height: 96)
    }
}

#Preview {
    let mockArtist = Artist(name: "Picasso", bio: "Like a bio of artist", image: "0", works: [])
    
    ArtistCardView(artist: mockArtist)
}
