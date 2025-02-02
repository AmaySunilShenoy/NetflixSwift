//
//  MovieCard.swift
//  LibraryApp
//
//  Created by Guest User on 15/01/2025.
//

import SwiftUI

struct MovieCard: View {
    var title: String;
    var poster: String;
    var body: some View {
                VStack(spacing: 20){
                    AsyncImage(url: URL(string: poster)) { phase in
                        switch phase {
                        case .empty:
                            ProgressView()
                            
                        case .success(let image):
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 150, height: 200)
                        case .failure(_):
                            Image("moana")
                                .resizable()
                            
                        @unknown default:
                            EmptyView()
                        }
                        
                    }
                    .frame(width: 150, height: 200)
                    .clipShape(RoundedRectangle(cornerRadius: 5))
                    
                    Text(title)
                        .foregroundColor(.netflixRed)
                        .lineLimit(1)
                        .truncationMode(/*@START_MENU_TOKEN@*/.tail/*@END_MENU_TOKEN@*/)
                }
                .padding(5)
                .frame(maxWidth: 200)
            }
    }

//#Preview {
//    MovieCard(title: "Moana 2", imageSrc: "moana")
//}
