//
//  Gallery.swift
//  VkSwiftUICoordinator
//
//  Created by Денис Ледовский on 30.05.2022.
//

import SwiftUI
import SDWebImageSwiftUI

struct GalleryView: View {

    @ObservedObject var viewModel: GalleryViewFactory

    init(viewModel: GalleryViewFactory) {
        self.viewModel = viewModel

    }

    var body: some View {

        let photoArray = viewModel.photos.chunked(into: 2)

        return VStack {

            ScrollView {

                VStack(spacing: 16) {

                    ForEach(photoArray.indices, id:\.self) { idx in

                        HStack {

                            ForEach(photoArray[idx].indices, id:\.self) { index in

                                HStack {
                                        Spacer()
                                    ZStack {
                                        WebImage(url: URL(string:photoArray[idx][index]))
                                            .resizable()
                                            .frame(maxWidth: 200, maxHeight: 200)
                                            .cornerRadius(8)
                                        LikeButton()
                                            .position(x: 170, y: 188)
                                    }
                                    Spacer()
                                }
                            }
                        }
                    }
                }
            }
            .onAppear { viewModel.fetch() }
        }
    }
}


