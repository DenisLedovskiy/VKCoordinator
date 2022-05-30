//
//  GroupsCoreData.swift
//  VK(SwiftUI)
//
//  Created by Денис Ледовский on 19.05.2022.
//

import UIKit
import CoreData
import SwiftUI


@objc(GroupsCoreData)
final class GroupsCoreData: NSManagedObject  {

    @NSManaged public var id: UUID
    @NSManaged public var name: String
    @NSManaged public var imageUrl: String
    @NSManaged public var subscribes: String

    //    @nonobjc public class func create(in context: NSManagedObjectContext,
    //                                      name: String,
    //                                      imageUrl: String?,
    //                                      subscribes: String) throws {
    //        let group = GroupsCoreData(context: context)
    //        group.name = name
    //        group.id = UUID()
    //        group.imageUrl = imageUrl ?? "default"
    //        group.subscribes = subscribes
    //        try context.save()
    //    }

    //    @nonobjc public class func fetchRequest() -> NSFetchRequest<GroupsCoreData> {
    //        return NSFetchRequest<GroupsCoreData>(entityName: "Groups")
    //    }
}

extension Groups {
    func convertGroupsCoreData() -> ViewDataCell {
        ViewDataCell(
            name: name!,
            imageName: imageUrl!,
            status: subscribes!,
            galleryId: 0
        )
    }
}

