//
//  TabBarView.swift
//  VkSwiftUICoordinator
//
//  Created by Денис Ледовский on 30.05.2022.
//

import SwiftUI

struct TabBarView: View {

    var viewModel: LoginViewModel

    var body: some View {
        TabView {
            FriendListView(viewModel: FriendsViewFactory(api: FriendsAPI(viewModel: viewModel)), loginViewModel: viewModel)
                .tabItem {
                    Image(systemName: "phone")
                    Text("Друзья")
                }
            GroupsListView(viewModel: GroupsViewFactory(api: GroupsAPI(viewModel: viewModel)))
                .tabItem {
                    Image(systemName: "heart")
                    Text("Группы")
                }
            NewsView()
                .tabItem{
                    Image(systemName: "newspaper")
                    Text("Новости")
                }
        }
    }
}

//struct TabBarView_Previews: PreviewProvider {
//    static var previews: some View {
//        TabBarView()
//    }
//}

