//
//  FriendsJSON.swift
//  VK(SwiftUI)
//
//  Created by Денис Ледовский on 18.05.2022.
//

import Foundation

struct FriendsResponse: Codable {
    var response: Response?
}

struct Response: Codable {
    var count: Int
    var items: [Items]
}

struct Items: Codable {
    var id: Int
    var firstName: String
    var lastName: String
    var photo100: String?
    var trackCode: String
    let online: Int?

    enum CodingKeys: String, CodingKey {
        case firstName = "first_name"
        case id
        case lastName = "last_name"
        case photo100 = "photo_100"
        case online
        case trackCode = "track_code"
    }
}
