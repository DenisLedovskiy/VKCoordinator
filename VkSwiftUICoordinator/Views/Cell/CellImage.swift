//
//  CellImage.swift
//  VkSwiftUICoordinator
//
//  Created by Денис Ледовский on 30.05.2022.
//

import SwiftUI
import SDWebImageSwiftUI

struct CellImage: View {

    var content: WebImage

    @State private var isScaled = false

    init(@ViewBuilder content: () -> WebImage) {
        self.content = content()
    }

    var body: some View { content
        .resizable()
        .frame(width: 60, height: 60, alignment: .leading)
        .cornerRadius(75)
        .modifier(CircleShadow(shadowColor: .gray, shadowRadius: 3))
        .padding(.vertical, 5)
        .scaleEffect(isScaled ? 2.0 : 1.0)
        .onTapGesture {
            withAnimation(.spring(response: 0.4,
                                  dampingFraction: 0.8,
                                  blendDuration: 0.5)) {
                self.isScaled.toggle()
            }
            self.isScaled.toggle()
        }
    }
}

