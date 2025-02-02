//
//  MovieScroll.swift
//  LibraryApp
//
//  Created by Guest User on 15/01/2025.
//

import SwiftUI

struct MovieScroll: View {
    @State var movies: [SearchMovie] = []
    var title: String;
    var query: String;
    var type: String = "";
    var body: some View {
            VStack(alignment: .leading){
                Text(title).frame(alignment: .leading).font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).bold().padding(10)
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 10) {
                        ForEach(movies) { movie in
                            NavigationLink(destination: MovieDetailView(movieId: movie.id, type: movie.type)) {
                                MovieCard(title: movie.title, poster: movie.poster)
                                
                            }
                        }
                    }
                }
            }
            .onAppear(){
                MovieService.search(query: query, type: type) {results in
                    movies = results
                }
            }
            .onChange(of: type){
                MovieService.search(query: query, type: type) {results in
                    movies = results
                }
            }
        }
}

#Preview {
    MovieScroll(title: "My Movies", query:"comedy")
}
