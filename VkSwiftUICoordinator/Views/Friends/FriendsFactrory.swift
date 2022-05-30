//
//  FriendsFactrory.swift
//  VkSwiftUICoordinator
//
//  Created by Денис Ледовский on 30.05.2022.
//

import SwiftUI

class FriendsViewFactory: ObservableObject {

    let api: FriendsService

    @Published var friends: [ViewDataCell] = []

    init(api: FriendsService) {
        self.api = api
    }

    public func fetch() {
        api.getFriends { [weak self] friends in
                 guard let self = self else { return }
            self.friends = self.fillFriendsArray(friends!)
             }
         }

    func fillFriendsArray(_ friendsInitialResponse: FriendsResponse) -> [ViewDataCell] {

        var fiendsArray: [ViewDataCell] = []

        let friendsCount = friendsInitialResponse.response?.items.count
        let friends = friendsInitialResponse.response?.items

        for i in 0...friendsCount! - 1 {

            fiendsArray.append(ViewDataCell(name: (friends?[i].firstName)! + (friends?[i].lastName)!,
                                             imageName: (friends?[i].photo100)!,
                                             status: (friends?[i].online?.description)!,
                                             galleryId: (friends?[i].id)!))
        }
        return(fiendsArray)
    }
}

