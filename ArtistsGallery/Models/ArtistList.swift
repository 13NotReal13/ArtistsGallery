//
//  ArtistList.swift
//  ArtistsGallery
//
//  Created by Иван Семикин on 09/07/2025.
//

import Foundation

struct ArtistList: Decodable {
    let artists: [Artist]
}

struct Artist: Decodable {
    let name: String
    let bio: String
    let image: String
    let works: [Work]
}

struct Work: Decodable {
    let title: String
    let image: String
    let info: String
}
