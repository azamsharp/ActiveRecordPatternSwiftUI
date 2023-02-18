//
//  MovieAppApp.swift
//  MovieApp
//
//  Created by Mohammad Azam on 2/18/23.
//

import SwiftUI

@main
struct MovieAppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, CoreDataProvider.shared.viewContext)
        }
    }
}
