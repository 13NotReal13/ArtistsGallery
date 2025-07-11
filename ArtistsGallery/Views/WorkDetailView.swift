//
//  WorkDetailView.swift
//  ArtistsGallery
//
//  Created by Иван Семикин on 11/07/2025.
//

import SwiftUI

struct WorkDetailView: View {
    let work: Work
    
    var body: some View {
        VStack {
            Image(work.image)
                .resizable()
                .scaledToFit()
            
            VStack {
                Text(work.title)
                    .font(.system(size: 20, weight: .bold))
                
                Text(work.info)
                    .foregroundStyle(.gray)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
            
            Spacer()
            
            Button {
                
            } label: {
                Text("Развернуть")
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background {
                        RoundedRectangle(cornerRadius: 18)
                            .foregroundStyle(.black)
                            .padding(.horizontal, 20)
                    }
            }
        }
        .ignoresSafeArea(edges: [.top, .horizontal])
    }
}

#Preview {
    NavigationStack {
        WorkDetailView(
            work: Work(
                title: "Title",
                image: "Picasso1",
                info: "Info"
            )
        )
    }
}
