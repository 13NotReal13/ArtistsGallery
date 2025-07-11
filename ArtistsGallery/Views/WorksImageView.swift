//
//  WorksImageView.swift
//  ArtistsGallery
//
//  Created by Иван Семикин on 11/07/2025.
//

import SwiftUI

struct WorksImageView: View {
    @EnvironmentObject private var coordinator: Coordinator
    
    let work: Work
    
    var body: some View {
        ZStack {
            Image(work.image)
                .resizable()
                .scaledToFit()
                .padding(.horizontal, 120)
                .frame(width: UIScreen.main.bounds.height)
                .rotationEffect(Angle(degrees: 90))
            
            VStack {
                Spacer()
                
                Button {
                    coordinator.dismissFullScreenCover()
                } label: {
                    Image(systemName: "xmark.circle")
                        .resizable()
                        .foregroundStyle(.gray)
                        .frame(width: 50, height: 50)
                        .padding(.leading, 280)
                }
            }
        }
    }
}

#Preview {
    WorksImageView(work: Work(title: "", image: "Picasso1", info: ""))
}
