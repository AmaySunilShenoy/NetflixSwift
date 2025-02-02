//
//  Movie.swift
//  LibraryApp
//
//  Created by Guest User on 24/01/2025.
//

import Foundation

// MARK: - SearchResponse
struct SearchResponse: Codable {
    let search: [SearchMovie]
    let totalResults, response: String

    enum CodingKeys: String, CodingKey {
        case search = "Search"
        case totalResults
        case response = "Response"
    }
}

// MARK: - Search
struct SearchMovie: Codable, Identifiable, Hashable, Equatable {
    let id: String
    let title, year, imdbID: String
    let type: String
    let poster: String

    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case imdbID
        case type = "Type"
        case poster = "Poster"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        title = try container.decode(String.self,forKey: .title)
        year = try container.decode(String.self,forKey: .year)
        imdbID = try container.decode(String.self,forKey: .imdbID)
        type = try container.decode(String.self,forKey: .type)
        poster = try container.decode(String.self,forKey: .poster)
        id = imdbID
    }
}

struct MovieResponse: Codable {
    let title, year, rated, released: String
    let runtime, genre, director, writer: String
    let actors, plot, language, country: String
    let awards: String
    let poster: String
    let ratings: [Rating]
    let metascore, imdbRating, imdbVotes, imdbID: String
    let type, dvd, boxOffice, production: String?
    let website, response: String?

    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case rated = "Rated"
        case released = "Released"
        case runtime = "Runtime"
        case genre = "Genre"
        case director = "Director"
        case writer = "Writer"
        case actors = "Actors"
        case plot = "Plot"
        case language = "Language"
        case country = "Country"
        case awards = "Awards"
        case poster = "Poster"
        case ratings = "Ratings"
        case metascore = "Metascore"
        case imdbRating, imdbVotes, imdbID
        case type = "Type"
        case dvd = "DVD"
        case boxOffice = "BoxOffice"
        case production = "Production"
        case website = "Website"
        case response = "Response"
    }
}

// MARK: - Rating
struct Rating: Codable {
    let source, value: String

    enum CodingKeys: String, CodingKey {
        case source = "Source"
        case value = "Value"
    }
}
