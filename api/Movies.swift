//
//  Movies.swift
//  LibraryApp
//
//  Created by Guest User on 24/01/2025.
//

import Foundation



class Movies: ObservableObject {
    @Published var movies: [SearchMovie] = []
}
