//
//  ContentView.swift
//  LibraryApp
//
//  Created by Guest User on 11/01/2025.
//

import SwiftUI

struct HomeView: View {
    @State private var selectedFilter: FilterModel? = nil
    
    var body: some View {
        ScrollView(.vertical){
            VStack {
                NetflixFilterBarView(selectedFilter: $selectedFilter)
                if selectedFilter?.title == "TV Shows" {
                    MovieScroll(title: "Comedy", query: "comedy", type: "series")
                    MovieScroll(title: "Horror", query: "horror", type: "series")
                    MovieScroll(title: "Romance", query: "romance", type: "series")
                } else if selectedFilter?.title == "Movies" {
                    MovieScroll(title: "Comedy", query: "comedy", type: "movie")
                    MovieScroll(title: "Horror", query: "horror", type: "movie")
                    MovieScroll(title: "Romance", query: "romance", type: "movie")
                } else {
                    MovieScroll(title: "Comedy", query: "comedy")
                    MovieScroll(title: "Horror", query: "horror")
                    MovieScroll(title: "Romance", query: "romance")
                }
                
            }
            
        }
    }
}

#Preview {
    HomeView()
}
