//
//  GroupApi.swift
//  VK(SwiftUI)
//
//  Created by Денис Ледовский on 18.05.2022.
//

import Foundation
import Alamofire
import SwiftUI

protocol GroupsService {
    func getGroups(completion: @escaping(GroupResponse?)->())
}

class GroupsAPI: GroupsService {

    @ObservedObject var session = Session.shared

    let baseUrl = "https://api.vk.com/method"
    var params: Parameters = [:]
    var request: String?



    //    MARK: - DTO
    func getGroups(completion: @escaping(GroupResponse?)->()) {

        let method = "/groups.get"
        let url = baseUrl + method

        self.params = [
            "client_id": session.cliendId,
            "user_id": session.userId,
            "access_token": session.token,
            "v": session.version
        ]

        params["extended"] = "1"
        params["fields"] = "members_count, status"
        params["count"] = "50"

        AF.request(url, method: .get, parameters: params).responseData { response in


            self.request = response.request?.description

            guard let data = response.data else { return }

            do {
                let groups = try JSONDecoder().decode(GroupResponse.self, from: data)
                completion(groups)
            } catch {
                print(error)
            }
        }
    }
}

