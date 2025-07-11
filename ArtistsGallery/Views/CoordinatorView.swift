//
//  CoordinatorView.swift
//  ArtistsGallery
//
//  Created by Иван Семикин on 11/07/2025.
//

import SwiftUI

struct CoordinatorView: View {
    @EnvironmentObject private var coordniator: Coordinator
    
    var body: some View {
        NavigationStack(path: $coordniator.path) {
            coordniator.build(.home)
                .navigationDestination(for: Page.self) { page in
                    coordniator.build(page)
                }
                .fullScreenCover(item: $coordniator.fullScreenCover) { fullScreenCover in
                    coordniator.build(fullScreenCover: fullScreenCover)
                }
        }
    }
}

#Preview {
    CoordinatorView()
        .environmentObject(Coordinator())
}
