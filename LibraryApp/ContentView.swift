//
//  ContentView.swift
//  LibraryApp
//
//  Created by Guest User on 11/01/2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image("netflix")
                .frame(width: 20, height: 20)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
