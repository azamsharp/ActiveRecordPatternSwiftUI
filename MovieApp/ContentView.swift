//
//  ContentView.swift
//  MovieApp
//
//  Created by Mohammad Azam on 2/18/23.
//

import SwiftUI

struct ContentView: View {
    
    @FetchRequest(fetchRequest: Movie.all)
    private var movieResults: FetchedResults<Movie>
    
    @State private var isPresented: Bool = false
    
    private func deleteMovie(indexSet: IndexSet) {
        
        guard let index = indexSet.map({ $0 }).first else {
            return
        }
        
        let movie = movieResults[index]
        do {
            try movie.delete()
        } catch {
            print(error)
        }
    }
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(movieResults) { movie in
                    NavigationLink(movie.title ?? "", value: movie)
                }.onDelete(perform: deleteMovie)
            }
            .navigationDestination(for: Movie.self, destination: { movie in
                // navigating to the detail view, which allows us to update the movie
                AddUpdateMovieView(movie: movie)
            })
            .navigationTitle("Movies")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button("Add Movie") {
                            isPresented = true
                        }
                    }
                }.sheet(isPresented: $isPresented) {
                    AddUpdateMovieView()
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environment(\.managedObjectContext, CoreDataProvider.shared.viewContext)
    }
}
