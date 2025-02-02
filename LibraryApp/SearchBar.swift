//
//  SearchBar.swift
//  LibraryApp
//
//  Created by Guest User on 22/01/2025.
//

import SwiftUI

struct SearchBar: View {
    @State public var searchText: String = "";
    @State public var isFocused: Bool = false;
    @State private var searchTask: Task<Void, Never>?
    @State private var isLoading: Bool = false;
    @ObservedObject var movies: Movies
    var body: some View {
        
        VStack{
            VStack {
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)
                        .padding(.leading, 10)
                    
                    TextField("Search something...", text: $searchText)
                        .onChange(of: searchText) {
                            guard !searchText.isEmpty && searchText.count >= 2 else {
                                return
                            }
                            isLoading = true
                            searchTask?.cancel()
                                    
                                    // Create new delayed task
                                    searchTask = Task {
                                        try? await Task.sleep(for: .milliseconds(500))
                                        // Check if task was cancelled
                                        guard !Task.isCancelled else { return }
                                        
                                        MovieService.search(query: searchText) { results in
                                            movies.movies = results
                                            isLoading = false
                                            print(movies.movies)
                                        }
                                    }
                        }
                        .focused(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=$isFocused@*/FocusState<Bool>().projectedValue/*@END_MENU_TOKEN@*/)
                        .padding(10)
                        .background(Color(.systemGray6))
                        .cornerRadius(10)
                        .onTapGesture {
                            isFocused = true
                        }
                        .padding(.horizontal, 10)
                    
                    
                    if !searchText.isEmpty {
                        Button(action: {
                            searchText = ""
                            isFocused = false
                        }) {
                            Image(systemName: "xmark.circle.fill")
                                .foregroundColor(.gray)
                                .padding(.trailing, 10)
                        }
                    }
                    NavigationLink(destination: AddFormView()){
                        Image(systemName: "plus.rectangle.fill.on.rectangle.fill")
                            .foregroundColor(.gray)
                            .padding(.leading, 10)
                    }
                }
                .padding(10)
            }
            .background(Color(.systemGroupedBackground))
            .padding(10)
            .cornerRadius(50)
        }
        if isLoading == false {
            if searchText != "" {
                if movies.movies != [] {
                    Text("Search Results for \(searchText)").frame(alignment: .leading).font(.subheadline).bold().padding(10)
                } else {
                    Text("No Results for \(searchText)").frame(alignment: .leading).font(.subheadline).bold().padding(.top,40)
                }
            } else {
                Text("Enter a search or click the button next to the search bar to add your own movie ").frame(alignment: .leading).font(.subheadline).bold().padding(.top,40)
            }
        } else {
            ProgressView()
        }
    }
}

