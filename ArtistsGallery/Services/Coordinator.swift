//
//  Coordinator.swift
//  ArtistsGallery
//
//  Created by Иван Семикин on 11/07/2025.
//

import Foundation
import SwiftUI

enum Page: Hashable {
    case home
    case artistDetail(Artist)
}

final class Coordinator: ObservableObject {
    @Published var path = NavigationPath()
    
    func push(_ page: Page) {
        path.append(page)
    }
    
    func pop() {
        path.removeLast()
    }
    
    @ViewBuilder
    func build(_ page: Page) -> some View {
        switch page {
        case .home:
            HomeView()
        case .artistDetail(let artist):
            ArtistDetailView(artist: artist)
        }
    }
}
