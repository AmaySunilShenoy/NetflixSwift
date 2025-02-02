# Netflix-inspired Library App

A SwiftUI-based iOS application that provides a Netflix-style interface for managing and browsing a movie library. The app uses SwiftData for local persistence and follows modern iOS development practices.

## Features

- 📱 Modern SwiftUI-based UI with tab-based navigation
- 🎬 Movie library management
- 🏠 Home view for featured content
- ➕ Add new movies to your library
- 📚 Browse your movie collection
- 💾 Local persistence using SwiftData
- 🎨 Netflix-inspired design elements

## Project Structure

```
LibraryApp/
├── LibraryApp/              # Main application source code
│   ├── LibraryAppApp.swift  # Main entry point
│   ├── TabBar.swift         # Tab-based navigation
├── persistence/             # Data persistence layer
├── api/                     # API integration
```

## Technical Details

### Main Components

#### App Entry Point (LibraryAppApp.swift)
The main entry point of the application initializes the SwiftData container and sets up the root view hierarchy:

```swift
@main
struct LibraryAppApp: App {
    let container: ModelContainer
    
    init() {
        do {
            container = try ModelContainer(for: MovieModel.self)
        } catch {
            fatalError("Could not init model container: \(error)")
        }
    }
    
    var body: some Scene {
        WindowGroup {
            TabBar()
        }
        .modelContainer(container)
    }
}
```

#### Navigation Structure
The app uses a tab-based navigation with three main sections:
- Home: Browse featured content
- Add: Add new movies to the library
- Library: View and manage your movie collection

## Installation

1. Clone the repository
2. Open `LibraryApp.xcodeproj` in Xcode
3. Build and run the project on your simulator or device

## Development

### Architecture
- SwiftUI for UI
- SwiftData for persistence
- MVVM architecture pattern
- Tab-based navigation structure

## Acknowledgments

- Inspired by Netflix's UI/UX design
- Built with SwiftUI and SwiftData 
- Inspired by the professor Antonin who taught me how to do this
