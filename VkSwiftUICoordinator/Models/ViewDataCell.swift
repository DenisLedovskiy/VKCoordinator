//
//  ViewDataCell.swift
//  VkSwiftUICoordinator
//
//  Created by Денис Ледовский on 30.05.2022.
//

import Foundation
import UIKit

class ViewDataCell: Identifiable {

    internal init(name: String, imageName: String, status: String, galleryId: Int) {
        self.name = name
        self.imageName = imageName
        self.status = status
        self.galleryId = galleryId

    }

    let id: UUID = UUID()
    let name: String
    let imageName: String
    let status: String
    let galleryId: Int
}
