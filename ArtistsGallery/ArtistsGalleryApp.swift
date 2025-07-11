//
//  ArtistsGalleryApp.swift
//  ArtistsGallery
//
//  Created by Иван Семикин on 07/07/2025.
//

import SwiftUI

@main
struct ArtistsGalleryApp: App {
    private var coordinator = Coordinator()
    
    var body: some Scene {
        WindowGroup {
            CoordinatorView()
                .environmentObject(coordinator)
        }
    }
}
