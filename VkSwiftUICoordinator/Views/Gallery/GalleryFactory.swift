//
//  GalleryFactory.swift
//  VkSwiftUICoordinator
//
//  Created by Денис Ледовский on 30.05.2022.
//

import SwiftUI

class GalleryViewFactory: ObservableObject {

    let api: PhotosService
    let friend: ViewDataCell

    @Published var photos: [String] = []

    init(friend: ViewDataCell, api: PhotosService) {
        self.friend = friend
        self.api = api
    }

    public func fetch() {

        api.getPhotos(userId: friend.galleryId) { [weak self] photos in
            self?.photos = (self?.fillPhotoArray(photos))!

        }
    }

    func fillPhotoArray(_ photoInitialResponse: PhotosInitialResponse) -> [String] {

        var photoArray: [String] = []
        let photoCount = photoInitialResponse.response.items.count
        let photo = photoInitialResponse.response.items

        if photoCount > 1 {
            for i in 0...photoCount - 1 {
                photoArray.append(photo[i].sizes[6].url)
            }
        }
        return(photoArray)
    }
}


