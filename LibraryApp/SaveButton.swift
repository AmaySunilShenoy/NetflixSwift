//
//  SaveMovie.swift
//  LibraryApp
//
//  Created by Guest User on 29/01/2025.
//

import SwiftUI
import SwiftData

struct SaveButton: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    @Query private var savedMovies: [MovieModel]
    @State private var isSaved: Bool = false
    @State private var showAlert = false
    let movie: MovieModel
    
    var body: some View {
        Button(action: {
            isSaved.toggle()
            if isSaved {
                saveMovie(movie: movie)
                
            } else {
                if let existingMovie = findExistingMovie(){
                    removeMovie(movie: existingMovie)
                }
            }
        }) {
            HStack(spacing: 8) {
                Image(systemName: isSaved ? "bookmark.fill" : "bookmark")
                    .font(.system(size: 16))
                Text(isSaved ? "Remove" : "Save")
                    .font(.system(size: 16, weight: .medium))
            }
            .foregroundColor(isSaved ? .white : .netflixRed)
            .padding(.horizontal, 16)
            .padding(.vertical, 8)
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .fill(isSaved ? Color.netflixRed : .clear)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .strokeBorder(Color.netflixRed, lineWidth: 1.5)
                    )
            )
        }
        .alert("Please fill all fields", isPresented: $showAlert , actions: {})
        .animation(.spring(duration: 0.2), value: isSaved)
        .onAppear{
            isSaved = checkIfMovieExists()
        }
       
    }
    
    private func checkIfMovieExists() -> Bool {
        savedMovies.contains {$0.imdbID == movie.imdbID}
    }
    
    private func findExistingMovie() -> MovieModel? {
        savedMovies.first {$0.imdbID == movie.imdbID}
    }
    
    private func saveMovie(movie: MovieModel) {
        if movie.title == "" || movie.plot == "" || movie.poster == "" {
            showAlert = true
            return
        }
        modelContext.insert(movie)
        dismiss()
        print("Saving movie: \(movie.imdbID)")
    }
    
    private func removeMovie(movie: MovieModel) {
        modelContext.delete(movie)
        dismiss()
        print("Removing movie: \(movie.imdbID)")
    }
}
