//
//  LibraryAppApp.swift
//  LibraryApp
//
//  Created by Guest User on 11/01/2025.
//

import SwiftUI
import SwiftData

@main
struct LibraryAppApp: App {
    let container: ModelContainer
    
    init() {
        do {
            container = try ModelContainer(for: MovieModel.self)
        } catch {
            fatalError("Could not init model contaienr: \(error)")
        }
    }
    var body: some Scene {
        WindowGroup {
            TabBar()
        }
        .modelContainer(container)
    }
}
