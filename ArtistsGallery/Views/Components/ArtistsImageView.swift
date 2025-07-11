//
//  ArtistsImageView.swift
//  ArtistsGallery
//
//  Created by Иван Семикин on 11/07/2025.
//

import SwiftUI

struct ArtistsImageView: View {
    let artist: Artist
    
    var body: some View {
        Image(artist.image)
            .resizable()
            .scaledToFill()
            .frame(maxWidth: UIScreen.main.bounds.width, maxHeight: 384)
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
    }
}

#Preview {
    ArtistsImageView(artist: Artist(name: "", bio: "", image: "3", works: []))
}
