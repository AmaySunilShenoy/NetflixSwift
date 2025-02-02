//
//  TabBar.swift
//  LibraryApp
//
//  Created by Guest User on 22/01/2025.
//

import SwiftUI

struct TabBar: View {
    var body: some View {
        TabView {
            NavigationView{
                NavigationStack{
                    HomeView()
                }
            }
            .tabItem {
                Label("Home",systemImage: "house.fill")
                    
            }
            NavigationView{
                AddView()
            }
                .tabItem {
                    Label("Add",systemImage: "plus.app")
                }
            NavigationView{
                LibraryView()
            }
                .tabItem {
                    Label("Library",systemImage: "books.vertical.fill")
                        
                }
        }
        .accentColor(.netflixRed)
        
    }
}

#Preview {
    TabBar()
}
