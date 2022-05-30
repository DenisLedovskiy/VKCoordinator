//
//  GroupJSON.swift
//  VK(SwiftUI)
//
//  Created by Денис Ледовский on 18.05.2022.
//

import Foundation

class GroupResponse: Codable {
    var response: GroupSecondLevel? = nil
}

class GroupSecondLevel: Codable {
    var count: Int
    var items: [GroupsItem]

}

class GroupsItem: Codable {
    var title: String
    var photo: String
    var id: Int
    var type: String
    var members_count: Int

    enum CodingKeys: String, CodingKey {
        case title = "name"
        case photo = "photo_50"
        case id = "id"
        case type
        case members_count
}

}

