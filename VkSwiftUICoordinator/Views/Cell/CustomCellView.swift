//
//  CustomCellView.swift
//  VkSwiftUICoordinator
//
//  Created by Денис Ледовский on 30.05.2022.
//

import SwiftUI
import SDWebImageSwiftUI

struct CellContentView: View {

    var data: ViewDataCell

    var body: some View {
        CellView(data: data)
    }
}

struct CellView: View {

    var data: ViewDataCell

    var body: some View {

        HStack {
            CellImage {
                WebImage(url: URL(string: data.imageName ))
            }

            VStack(alignment: .leading){
                Text(data.name)
                    .font(.custom("Arial", fixedSize: 20))
                if data.status == "1" {
                Text("Онлайн")
                    .foregroundColor(.gray)
                    .font(.custom("Arial", fixedSize: 15))
                }
                if data.status == "0" {
                    Text("Оффлайн")
                        .foregroundColor(.gray)
                        .font(.custom("Arial", fixedSize: 15))
                } else {
                    Text(data.status)
                        .foregroundColor(.gray)
                        .font(.custom("Arial", fixedSize: 15))
                }
            }
        }
    }
}

//struct CustomCellView_Previews: PreviewProvider {
//
//    static var previews: some View {
//        CellContentView(data: FriendList.friends.first!)
//    }
//}

extension View {

    func debug() -> Self {
        print(Mirror(reflecting: self).subjectType)
        return self
    }
}


