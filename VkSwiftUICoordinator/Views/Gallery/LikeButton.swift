//
//  LikeButton.swift
//  VkSwiftUICoordinator
//
//  Created by Денис Ледовский on 30.05.2022.
//

import SwiftUI

 struct LikeButton: View {

     @State private var isLiked = false

     var body: some View {

         HStack{
             ZStack {
                 Image(systemName: "heart.fill")
                     .scaleEffect(isLiked ? 1.0 : 0.0)

                 Image(systemName: "heart")
                     .foregroundColor(.red)
             }
         }
         .foregroundColor(isLiked ? .red : .white)
         .onTapGesture {
             withAnimation(.easeInOut(duration: 0.25)) {
                 isLiked.toggle()
             }
         }
     }
 }


     struct LikeButton_Previews: PreviewProvider {
         static var previews: some View {
             LikeButton()
         }
     }

