//
//  ContentView.swift
//  LibraryApp
//
//  Created by Guest User on 11/01/2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView(.vertical){
            VStack {
                //            Image("netflix")
                //                .resizable()
                //                .frame(width: 20, height: 20)
                //                .foregroundStyle(.tint)
                NetflixFilterBarView()
                MovieScroll()
                MovieScroll()
                MovieScroll()
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
