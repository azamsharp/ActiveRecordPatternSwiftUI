//
//  CoreDataProvider.swift
//  MovieApp
//
//  Created by Mohammad Azam on 2/11/23.
//

import Foundation
import CoreData

class CoreDataProvider {
    
    static let shared = CoreDataProvider()
    let persistentContainer: NSPersistentContainer
    
    var viewContext: NSManagedObjectContext {
        persistentContainer.viewContext
    }
    
    private init() {

        persistentContainer = NSPersistentContainer(name: "MovieModel")
        persistentContainer.loadPersistentStores { description, error in
            if let error = error {
                fatalError("Unable to initialize model \(error)")
            }
        }
    }
    
}
