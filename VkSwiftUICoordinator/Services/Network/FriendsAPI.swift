//
//  FriendsAPI.swift
//  VK(SwiftUI)
//
//  Created by Денис Ледовский on 18.05.2022.
//

import Foundation
import Alamofire
import SwiftUI

protocol FriendsService {
    func getFriends(completion: @escaping (FriendsResponse?) -> ())
}


class FriendsAPI: FriendsService {

    @ObservedObject var session = Session.shared

    let baseUrl = "https://api.vk.com/method"
    var params: Parameters = [:]
    var request: String?

    func getFriends(completion: @escaping (FriendsResponse?) -> ()) {
        let method = "/friends.get"
        let url = baseUrl + method

        self.params = [
            "client_id": session.cliendId,
            "user_id": session.userId,
            "access_token": session.token,
            "v": session.version,
        ]

        params["extended"] = "1"
        params["fields"] = "photo_100,online"

        AF.request(url, method: .get, parameters: params).responseData { response in
            self.request = response.request?.description
            guard let data = response.data else { return }

            do {
                var friends: FriendsResponse
                friends = try JSONDecoder().decode(FriendsResponse.self, from: data)
                completion(friends)
            } catch {
                print(error)
            }
        }
    }
}
