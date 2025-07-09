//
//  ArtistCardView.swift
//  ArtistsGallery
//
//  Created by Иван Семикин on 08/07/2025.
//

import SwiftUI

struct ArtistTest {
    let name = "Pablo Picasso"
    let info = "Pablo Ruiz y Picasso (25 October 1881 – 8 April 19..."
}

struct ArtistCardView: View {
    var artist: ArtistTest
    
    var body: some View {
        HStack(spacing: 16) {
            Image("Picasso")
                .frame(width: 96, height: 96)
            
            VStack(alignment: .leading) {
                Spacer()
                
                Text(artist.name)
                    .foregroundStyle(.gray)
                
                Spacer()
                
                Text(artist.info)
                    .lineLimit(2)
                    .fixedSize(horizontal: false, vertical: true)
                
                Spacer()
            }
        }
        .frame(width: .infinity, height: 96)
    }
}

#Preview {
    ArtistCardView(artist: ArtistTest())
}
