//
//  MovieModel.swift
//  LibraryApp
//
//  Created by Guest User on 29/01/2025.
//

import SwiftUI
import SwiftData


@Model
final class MovieModel {
    var imdbID: String
    var title: String
    var released: String
    var plot: String
    var poster: String
    var imdbRating: String
    var type: String
    
    
    init(
        imdbID: String,
        title: String,
        released: String = "N/A",
        plot: String,
        poster: String,
        imdbRating: String = "0.0",
        type: String="api"
    ) {
        self.imdbID = imdbID
        self.title = title
        self.released = released
        self.plot = plot
        self.poster = poster
        self.imdbRating = imdbRating
        self.type=type
    }
    
}

// added for debugging cause idk whats happening
extension MovieModel: CustomStringConvertible {
    var description: String {
        return """
        Movie ID: \(imdbID)
        Title: \(title)
        Released: \(released)
        Plot: \(plot)
        Poster URL: \(poster)
        IMDb Rating: \(imdbRating)
        """
    }
}
