//
//  WorkDetailView.swift
//  ArtistsGallery
//
//  Created by Иван Семикин on 11/07/2025.
//

import SwiftUI

struct WorkDetailView: View {
    @EnvironmentObject private var coordinator: Coordinator
    
    let work: Work
    
    var body: some View {
        VStack {
            Image(work.image)
                .resizable()
                .scaledToFit()
            
            VStack(alignment: .leading) {
                Text(work.title)
                    .font(.system(size: 20, weight: .bold))
                
                Text(work.info)
                    .foregroundStyle(.gray)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
            
            Spacer()
            
            Button {
                coordinator.present(fullScreenCover: .worksImage(work))
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
