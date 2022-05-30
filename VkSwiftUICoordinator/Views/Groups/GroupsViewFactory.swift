//
//  GroupsViewFactory.swift
//  VkSwiftUICoordinator
//
//  Created by Денис Ледовский on 30.05.2022.
//

import SwiftUI

class GroupsViewFactory: ObservableObject {

    let api: GroupsService

    @Published var groups: [ViewDataCell] = []

    init(api: GroupsService) {
        self.api = api
    }


    func fetch() {
        api.getGroups { [weak self] groups in
                 guard let self = self else { return }
            self.groups = self.fillGroupsArray(groups!)
             }
         }

    func fillGroupsArray(_ groupsInitialResponse: GroupResponse) -> [ViewDataCell] {

        var groupsArray: [ViewDataCell] = []
        let groupsCount = groupsInitialResponse.response?.items.count
        let groups = groupsInitialResponse.response?.items

        for i in 0...groupsCount! - 1 {

            groupsArray.append(ViewDataCell(name: (groups?[i].title)!,
                                            imageName: (groups?[i].photo)!,
                                            status: "\(groups?[i].members_count.description ?? "--") подписчиков",
                                            galleryId: 0))
        }
        return(groupsArray)
    }
}

