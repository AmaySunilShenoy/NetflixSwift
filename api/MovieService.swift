//
//  MovieService.swift
//  LibraryApp
//
//  Created by Guest User on 24/01/2025.
//

import Foundation

struct MovieService {
    
    static func search(query: String, type:String = "", completion: @escaping ([SearchMovie]) -> Void) {
        var urlComponents = URLComponents(string: "https://www.omdbapi.com")!
        urlComponents.queryItems = [
            URLQueryItem(name: "apikey", value: "b9b6efde"),
            URLQueryItem(name: "s", value: query),
            URLQueryItem(name: "type", value: type)
        ]
        
        guard let url = urlComponents.url else {
            print("Invalid URL")
            completion([])
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                completion([])
                return
            }
            
            if let data = data {
                do {
                    let decodedMovies = try JSONDecoder().decode(SearchResponse.self, from: data)
                    DispatchQueue.main.async {
                        completion(decodedMovies.search)
                    }
                } catch {
                    print("Decoding error: \(error)")
                    completion([])
                }
            } else {
                completion([])
            }
        }.resume()
    }
    
    static func getMovieById(id: String, completion: @escaping (MovieModel?) -> Void) {
        var urlComponents = URLComponents(string: "https://www.omdbapi.com")!
        urlComponents.queryItems = [
            URLQueryItem(name: "apikey", value: "b9b6efde"),
            URLQueryItem(name: "i", value: id),
        ]
        
        guard let url = urlComponents.url else {
            print("Invalid URL")
            completion(nil)
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                completion(nil)
                return
            }
            
            if let data = data {
                do {
                    let decodedMovie = try JSONDecoder().decode(MovieResponse.self, from: data)
                    DispatchQueue.main.async {
                        let movie = MovieModel(imdbID: decodedMovie.imdbID, title: decodedMovie.title, released: decodedMovie.released, plot: decodedMovie.plot, poster: decodedMovie.poster, imdbRating: decodedMovie.imdbRating)
                        
                        completion(movie)
                    }
                } catch {
                    print("Decoding error: \(error)")
                    completion(nil)
                }
            } else {
                completion(nil)
            }
        }.resume()
    }
}
