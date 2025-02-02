//
//  AddView.swift
//  LibraryApp
//
//  Created by Guest User on 22/01/2025.
//

import SwiftUI

struct AddView: View {
    @StateObject private var movies = Movies()
    
    var body: some View {
        NavigationStack{
            VStack{
                SearchBar(movies:movies)
                ResultsView(movies:movies)
            }
        }
        
    }
}

#Preview {
    AddView()
}
