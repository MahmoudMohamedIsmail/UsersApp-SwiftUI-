//
//  LocalFavoritesCoreData.swift
//  UsersApp
//
//  Created by Mahmoud Ismail on 08/10/2024.
//

import CoreData
import UIKit

protocol LocalFavoritesProtocol {
    
    func addUser(id: Int)
    func removeUser(id: Int)
    func retriveUsersIds() -> [Int]
}

class LocalFavorites {
    
    // MARK: - Singleton Instance
    static let shared = LocalFavorites()
    
    private var currentFavoriteUsers: [FavoriteUser] = []
    
    private init() {}

    // MARK: - Core Data Stack
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "LocalFavorites") // Use your Core Data model name
        container.loadPersistentStores { description, error in
            if let error = error {
                fatalError("Unable to load persistent stores: \(error)")
            }
        }
        return container
    }()
    
    var context: NSManagedObjectContext {
        return persistentContainer.viewContext
    }

    // MARK: - Core Data Saving Support
    func saveContext() {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}



extension LocalFavorites: LocalFavoritesProtocol {
    
    func addUser(id: Int) {
        let newUserId = FavoriteUser(context: context)
        newUserId.id = Int32(id)
        saveContext()
    }
    
    func removeUser(id: Int) {
       for user in currentFavoriteUsers where user.id == Int32(id) {
           context.delete(user)
        }
        saveContext()
    }

    func retriveUsersIds() -> [Int] {
        let fetchRequest: NSFetchRequest<FavoriteUser> = FavoriteUser.fetchRequest()
        
        do {
            let items = try context.fetch(fetchRequest)
            currentFavoriteUsers = items
            return items.map { Int($0.id) }
        } catch {
            print("Failed to fetch items: \(error)")
            return []
        }
    }
}
