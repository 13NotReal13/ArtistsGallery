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
    case workDetail(Work)
}

enum FullScreenCover: Identifiable {
    case worksImage(Work)
    
    var id: String {
        switch self {
        case .worksImage(let work):
            work.title
        }
    }
}

final class Coordinator: ObservableObject {
    @Published var path = NavigationPath()
    @Published var fullScreenCover: FullScreenCover?
    
    func push(_ page: Page) {
        path.append(page)
    }
    
    func pop() {
        path.removeLast()
    }
    
    func present(fullScreenCover: FullScreenCover) {
        self.fullScreenCover = fullScreenCover
    }
    
    func dismissFullScreenCover() {
        fullScreenCover = nil
    }
    
    @ViewBuilder
    func build(_ page: Page) -> some View {
        switch page {
        case .home:
            HomeView()
        case .artistDetail(let artist):
            ArtistDetailView(artist: artist)
        case .workDetail(let work):
            WorkDetailView(work: work)
        }
    }
    
    @ViewBuilder
    func build(fullScreenCover: FullScreenCover) -> some View {
        switch fullScreenCover {
        case .worksImage(let work):
            WorksImageView(work: work)
        }
    }
 }
