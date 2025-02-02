//
//  ProfileView.swift
//  LibraryApp
//
//  Created by Guest User on 22/01/2025.
//

import SwiftUI
import SwiftData

struct LibraryView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    @Query private var movies: [MovieModel]
    
    @State private var searchText = ""
    @State private var sortOption: SortOption = .title
    @State private var showingAddMovie = false
    @State private var selectedMovie: MovieModel?
    @State private var gridLayout = 2
    
    enum SortOption: String, CaseIterable {
        case title = "Title"
        case releaseYear = "Year"
        case rating = "Rating"
        case dateAdded = "Date Added"
    }
    
    private var filteredMovies: [MovieModel] {
        var result = movies
        if !searchText.isEmpty {
            result = result.filter { movie in
                movie.title.localizedCaseInsensitiveContains(searchText)
            }
        }
        
        return result
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                // Grid of movies
                ScrollView {
                    LazyVGrid(
                        columns: Array(repeating: GridItem(.flexible(), spacing: 16), count: gridLayout),
                        spacing: 16
                    ) {
                        ForEach(filteredMovies) { movie in
                            NavigationLink(destination: MovieDetailView(movieId: movie.imdbID, type: movie.type)) {
                                MovieCard(title: movie.title, poster: movie.poster)
                                    .onTapGesture {
                                        selectedMovie = movie
                                    }
                            }
                        }
                    }
                    .padding()
                }
            }
            .navigationTitle("Movie Library")
            .searchable(text: $searchText, prompt: "Search movies")
            .sheet(item: $selectedMovie) { movie in
                MovieDetailView(movieId: movie.imdbID, type: movie.type)
            }
        }
    }
}
#Preview {
    LibraryView()
        .modelContainer(for: MovieModel.self, inMemory: true)
}
