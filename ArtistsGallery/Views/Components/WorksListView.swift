//
//  WorksListView.swift
//  ArtistsGallery
//
//  Created by Иван Семикин on 11/07/2025.
//

import SwiftUI

struct WorksListView: View {
    let works: [Work]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Works")
                .fontWeight(.semibold)
            
            ScrollView {
                ForEach(works, id:\.title) { work in
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
    }
}
