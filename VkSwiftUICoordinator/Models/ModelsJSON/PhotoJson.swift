//
//  PhotoJson.swift
//  VK(SwiftUI)
//
//  Created by Денис Ледовский on 18.05.2022.
//

import Foundation

struct PhotosInitialResponse: Codable {
    let response: PhotosResponse
}

struct PhotosResponse: Codable {
    let count: Int
    let items: [PhotosItems]
}

struct PhotosItems: Codable {
//    let likes: PhotosLikes
    let sizes: [PhotosSizes]
}

//struct PhotosLikes: Codable {
//    let count: Int
//}

struct PhotosSizes: Codable {
    let url: String
    let type: String
}
