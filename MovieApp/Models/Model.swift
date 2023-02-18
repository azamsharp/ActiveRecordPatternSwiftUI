//
//  Model.swift
//  MovieApp
//
//  Created by Mohammad Azam on 2/18/23.
//

import Foundation
import CoreData

protocol Model {
    
}

extension Model where Self: NSManagedObject {
    
    func save() throws {
        try CoreDataProvider.shared.viewContext.save()
    }
    
    func delete() throws {
        CoreDataProvider.shared.viewContext.delete(self)
        try save()
    }
    
    static var all: NSFetchRequest<Self> {
        let request = NSFetchRequest<Self>(entityName: String(describing: self))
        request.sortDescriptors = []
        return request
    }
    
}
