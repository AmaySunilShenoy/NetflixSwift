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
                MovieScroll(title: "Comedy \(selectedFilter?.title ?? "")", query: "comedy", type: selectedFilter?.query ?? "")
                    MovieScroll(title: "Horror \(selectedFilter?.title ?? "")", query: "horror", type: selectedFilter?.query ?? "")
                    MovieScroll(title: "Romance \(selectedFilter?.title ?? "")", query: "romance", type: selectedFilter?.query ?? "")
                
            }
            
        }
    }
}

#Preview {
    HomeView()
}
