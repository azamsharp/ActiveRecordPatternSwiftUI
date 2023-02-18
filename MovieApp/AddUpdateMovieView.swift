//
//  AddMovieView.swift
//  MovieApp
//
//  Created by Mohammad Azam on 2/18/23.
//

import SwiftUI

struct EditMovieConfig {
    
    var title: String = ""
    
    init(movie: Movie? = nil) {
        guard let movie = movie else { return }
        self.title = movie.title ?? ""
    }
}

struct AddUpdateMovieView: View {
    
    var movie: Movie?
    
    @State private var editMovieConfig = EditMovieConfig()
    @Environment(\.dismiss) private var dismiss
    @Environment(\.managedObjectContext) private var viewContext
    
    private func saveOrUpdateMovie() {
        let movie = movie ?? Movie(context: viewContext)
        movie.title = editMovieConfig.title
        do {
            try movie.save()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    var body: some View {
        Form {
            TextField("Title", text: $editMovieConfig.title)
            Button("Save") {
                saveOrUpdateMovie()
                dismiss()
            }
        }.onAppear {
            if let movie = movie {
                editMovieConfig = EditMovieConfig(movie: movie)
            }
        }
    }
}

struct AddUpdateMovieView_Previews: PreviewProvider {
    static var previews: some View {
        AddUpdateMovieView()
    }
}
