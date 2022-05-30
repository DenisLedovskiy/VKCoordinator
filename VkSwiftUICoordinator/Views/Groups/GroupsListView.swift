//
//  GroupsListView.swift
//  VkSwiftUICoordinator
//
//  Created by Денис Ледовский on 30.05.2022.
//

import SwiftUI

struct GroupsListView: View {

    @ObservedObject var viewModel: GroupsViewFactory

    init(viewModel: GroupsViewFactory) {
        self.viewModel = viewModel
    }

    var body: some View {

        List(viewModel.groups.sorted(by: { $0.name < $1.name }), id: \.id) { group in
            CellContentView(data: group)
        }
        .onAppear { viewModel.fetch() }
        .navigationBarTitle("Группы", displayMode: .inline)
    }
}

//struct GroupsView_Previews: PreviewProvider {
//    static var previews: some View {
//        GroupsListView(viewModel: GroupsViewFactory(api: GroupsAPI()))
//    }
//}
