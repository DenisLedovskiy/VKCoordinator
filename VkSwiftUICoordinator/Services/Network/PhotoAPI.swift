//
//  PhotoAPI.swift
//  VK(SwiftUI)
//
//  Created by Денис Ледовский on 18.05.2022.
//

import Foundation
import Alamofire
import SwiftUI

protocol PhotosService {
    func getPhotos(userId: Int, completion: @escaping(PhotosInitialResponse)->())
}

class PhotosAPI: PhotosService {

    @ObservedObject var session = Session.shared

    let baseUrl = "https://api.vk.com/method"
    var params: Parameters = [:]
    var request: String?


    // MARK: - DTO Вызов фото друзей
    func getPhotos(userId: Int, completion: @escaping(PhotosInitialResponse)->()) {
        let method = "/photos.getAll"
        let url = baseUrl + method

            self.params = [
            "owner_id": ("\(userId)"),
            "access_token": session.token,
            "v": session.version
        ]
        params["count"] = "100"


        AF.request(url, method: .get, parameters: params).responseData {response in
            self.request = response.request?.description

            guard let jsonData = response.data else { return }

            do {
            let photo = try JSONDecoder().decode(PhotosInitialResponse.self, from: jsonData)

                completion(photo)
            } catch {
                print(error)
            }
        }
    }
}


