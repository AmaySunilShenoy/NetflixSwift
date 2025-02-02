import SwiftUI
import SwiftData

struct AddFormView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    @State private var movie = MovieModel(imdbID: UUID().uuidString, title: "", released: "", plot: "", poster: "", imdbRating: "0.0", type: "user")
    @State private var releasedDate = Date()
    @State private var isSaved: Bool = false
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Movie Details")) {
                    TextField("Title", text: $movie.title)
                        .padding(.vertical)
                
                    DatePicker("Released Date", selection: $releasedDate, displayedComponents: .date)
                        .padding(.vertical)
                        .onChange(of: releasedDate){
                            let dateFormatter = DateFormatter()
                            dateFormatter.dateFormat = "dd MMM yyyy"
                            let releasedString = dateFormatter.string(from: releasedDate)
                            movie.released = releasedString
                        }
                    
               
                    TextField("Plot", text: $movie.plot)
                        .padding(.vertical)
                 
                    TextField("Poster URL", text: $movie.poster)
                        .padding(.vertical)
                
                    TextField("IMDb Rating", text: $movie.imdbRating)
                        .keyboardType(.decimalPad)
                        .padding(.vertical)
                }
                
                   
                
                if isSaved {
                    Section {
                        Text("Movie saved successfully!")
                            .foregroundColor(.green)
                            .font(.subheadline)
                            .padding()
                    }
                }
            }
            .navigationTitle("Add Movie")
        }
        SaveButton(movie: movie)
    }
}

#Preview {
    AddFormView()
}
