//
//  ResultsView.swift
//  LibraryApp
//
//  Created by Guest User on 24/01/2025.
//

import SwiftUI

struct ResultsView: View {
    @ObservedObject var movies: Movies
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    var body: some View {
            VStack(alignment: .leading){
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 20){
                        ForEach(movies.movies, id: \.self) { movie in
                            NavigationLink(destination: MovieDetailView(movieId: movie.id, type:movie.type)) {
                                MovieCard(title: movie.title, poster: movie.poster)
                                
                            }
                        }
                    }
            }
        }
    }
}

