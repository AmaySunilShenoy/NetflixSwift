//
//  NetflixFilterBarView.swift
//  LibraryApp
//
//  Created by Guest User on 11/01/2025.
//

import SwiftUI

struct FilterModel: Hashable, Equatable {
    let title: String
    let isDropdown: Bool
    
    static 
}

struct NetflixFilterBarView: View {
    
    var onXMarkPressed: (() -> Void)? = nil
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                Image(systemName: "xmark")
                    .padding(8)
                    .background(
                        Circle()
                            .stroke(lineWidth: 1)
                    )
                    .foregroundStyle(.netflixLightGray)
                    .onTapGesture {
                        onXMarkPressed?()
                    }
                
                ForEach(0..<3) { _ in
                        NetflixFilterView(
                            title:
                        )
                }
            }
            .padding(.vertical, 4)
        }
        .scrollIndicators(.hidden)
    }
}

#Preview {
    NetflixFilterBarView()
}
