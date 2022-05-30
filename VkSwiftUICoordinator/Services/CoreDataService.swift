//
//  CoreDataService.swift
//  VK(SwiftUI)
//
//  Created by Денис Ледовский on 19.05.2022.
//

import Foundation
import CoreData

class CoreDataService {

    private let modelName: String
    var context: NSManagedObjectContext { storeContainer.viewContext }

    private lazy var storeContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: self.modelName)
        container.loadPersistentStores { (storeDescription, error) in
            if let error = error { fatalError("Unresolved error \(error),\(error.localizedDescription)")
            }
        }
        return container
    }()

    init(modelName: String) {
        self.modelName = modelName
    }

//    func saveContext() throws {
//        guard context.hasChanges else { return }
//    }


    func saveGroup(name: String, imageUrl: String, subscribes: String) {

        let group = Groups(context: storeContainer.viewContext)
        group.name = name
        group.imageUrl = imageUrl
        group.subscribes = subscribes

        do {
            try
            storeContainer.viewContext.save()
        } catch {
            print("Failed save \(error)")
        }
    }

    func getAllGroups() -> [Groups] {

        let fetchRequest: NSFetchRequest<Groups> = Groups.fetchRequest()

        do {
            return try storeContainer.viewContext.fetch(fetchRequest)
        } catch {
            return []
        }
    }
}

