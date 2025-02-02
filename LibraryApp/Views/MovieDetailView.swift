import SwiftUI
import SwiftData

struct MovieDetailView: View {
    let movieId: String
    let type: String
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var modelContext
    @Query private var savedMovies: [MovieModel]
    @State var movie: MovieModel? = nil
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                if movie == nil {
                    ProgressView()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                } else {
                    // Improved image container
                    ZStack {
                        Rectangle()
                            .fill(Color.gray.opacity(0.2))
                            .frame(height: 450)
                        
                        AsyncImage(url: URL(string: movie?.poster ?? "moana")) { phase in
                            switch phase {
                            case .empty:
                                ProgressView()
                            case .success(let image):
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(maxHeight: 450)
                            case .failure:
                                Image("moana")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                            @unknown default:
                                EmptyView()
                            }
                        }
                    }
                    
                    VStack(alignment: .leading, spacing: 16) {
                        Text(movie?.title ?? "Not Found")
                            .font(.title)
                            .foregroundColor(.netflixRed)
                            .bold()
                        
                        HStack {
                                Image(systemName: "star.fill")
                                Text("\(movie!.imdbRating)")
                            Spacer()
                            Image(systemName: "calendar")
                            Text("\(movie!.released)")
                        }
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        
                        Text("Overview")
                            .font(.headline)
                        
                        Text(movie?.plot ?? "Description Not Found")
                            .font(.body)
                    }
                    .padding()
                }
            }
        }
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: { dismiss() }) {
                    HStack(spacing: 4) {
                        Image(systemName: "chevron.left")
                            .font(.system(size: 16, weight: .semibold))
                        Text("Back")
                    }
                    .foregroundColor(.netflixRed)
                }
            }
        }
        .onAppear {
            if type == "user"{
                movie = savedMovies.first {$0.imdbID == movieId}
            } else {
                print(type)
                MovieService.getMovieById(id: movieId) { result in
                    movie = result
                }
            }
        }
        if movie != nil {
            SaveButton(movie: movie!)
        }
        
    }
}


#Preview {
    NavigationStack {
        MovieDetailView(movieId: "tt3766394", type: "user")
    }
}
