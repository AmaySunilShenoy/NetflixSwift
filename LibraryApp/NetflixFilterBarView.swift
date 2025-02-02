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
    let query: String
    
    static var mockArray: [FilterModel] {
        [
            FilterModel(title: "TV Shows", isDropdown: false, query:"series"),
            FilterModel(title: "Movies", isDropdown: false, query:"movie")
        ]
    }
}

struct NetflixFilterBarView: View {
    
    var onXMarkPressed: (() -> Void)? = nil
    @Binding var selectedFilter: FilterModel?;
    var filters: [FilterModel] = FilterModel.mockArray
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                
                if selectedFilter != nil {
                    Image(systemName: "xmark")
                        .padding(8)
                        .background(
                            Circle()
                                .stroke(lineWidth: 1)
                        )
                        .foregroundStyle(.netflixLightGray)
                        .onTapGesture {
                            onXMarkPressed?()
                            selectedFilter = nil
                        }
                        .transition(AnyTransition.move(edge: .leading))
                        .padding(.leading, 16)
                }
                
                ForEach(filters, id: \.self) { filter in
                        NetflixFilterView(
                            title: filter.title,
                            isDropdown: filter.isDropdown,
                            isSelected: selectedFilter == filter
                        )
                        .background(Color.black.opacity(0.001))
                        .onTapGesture {
                            if selectedFilter == nil {
                                selectedFilter = filter
                            } else if selectedFilter == filter {
                                selectedFilter = nil
                            }
                        }
                        .padding(.leading, ((selectedFilter == nil) && filter == filters.first ) ? 16 : 0)
                }
                
                
            }
            .padding(.vertical, 4)
        }
        .scrollIndicators(.hidden)
        .animation(.bouncy, value: selectedFilter)
    }
}
