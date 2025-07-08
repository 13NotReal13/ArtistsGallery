//
//  SearchBarView.swift
//  ArtistsGallery
//
//  Created by Иван Семикин on 08/07/2025.
//

import SwiftUI

struct SearchBarView: View {
    @Binding var searchText: String
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundStyle(.gray)
            
            TextField("Search", text: $searchText)
                .autocorrectionDisabled()
        }
        .padding()
        .background {
            RoundedRectangle(cornerRadius: 15)
                .foregroundStyle(.gray.opacity(0.1))
        }
        .padding()
    }
}

#Preview {
    SearchBarView(searchText: .constant(""))
}
