//
//  FriendsView.swift
//  VkSwiftUICoordinator
//
//  Created by Денис Ледовский on 30.05.2022.
//

import SwiftUI

struct FriendListView: View {

    @ObservedObject var viewModel: FriendsViewFactory
    @ObservedObject var loginViewModel: LoginViewModel

    init(viewModel: FriendsViewFactory, loginViewModel: LoginViewModel) {
        self.viewModel = viewModel
        self.loginViewModel = loginViewModel
    }

    var body: some View {

        List(viewModel.friends.sorted(by: { $0.name < $1.name }), id: \.id) { friend in
            NavigationLink(destination: GalleryView(viewModel: GalleryViewFactory(friend: friend, api: PhotosAPI(viewModel: loginViewModel)))) {
                CellContentView(data: friend)
            }
        }
        .onAppear { viewModel.fetch() }
        .navigationBarTitle("Друзья", displayMode: .inline)
    }
}

//struct FriendListView_Previews: PreviewProvider {
//    static var previews: some View {
//        FriendListView(viewModel: FriendsViewFactory(api: FriendsAPI(viewModel: Fr)))
//    }
//}
