//
//  FriendsAPI.swift
//  VkSwiftUICoordinator
//
//  Created by Денис Ледовский on 30.05.2022.
//

import Foundation
import Alamofire
import SwiftUI

protocol FriendsService {
    func getFriends(completion: @escaping (FriendsResponse?) -> ())
}


class FriendsAPI: FriendsService {

    @ObservedObject var viewModel: LoginViewModel

       init(viewModel: LoginViewModel) {
           self.viewModel = viewModel
       }

    let baseUrl = "https://api.vk.com/method"
    var params: Parameters = [:]
    var request: String?

    func getFriends(completion: @escaping (FriendsResponse?) -> ()) {
        let method = "/friends.get"
        let url = baseUrl + method

        self.params = [
            "client_id": viewModel.cliendId,
            "user_id": viewModel.userId,
            "access_token": viewModel.token,
            "v": viewModel.version,
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
