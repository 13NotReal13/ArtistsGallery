//
//  WorksListView.swift
//  ArtistsGallery
//
//  Created by Иван Семикин on 11/07/2025.
//

import SwiftUI

struct WorksListView: View {
    @EnvironmentObject private var coordinator: Coordinator
    
    let works: [Work]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Works")
                .fontWeight(.semibold)
            
            ScrollView {
                ForEach(works, id:\.image) { work in
                    VStack(alignment: .leading) {
                        Image(work.image)
                            .resizable()
                            .scaledToFill()
                            .frame(height: 150)
                            .clipShape(.rect(cornerRadius: 12))
                        
                        Text(work.title)
                    }
                    .onTapGesture {
                        coordinator.push(.workDetail(work))
                    }
                    .padding(.bottom, 16)
                }
            }
            .scrollIndicators(.hidden)
            .padding(.bottom, 16)
        }
        .padding(.horizontal)
    }
}
