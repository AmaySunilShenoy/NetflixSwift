//
//  NetflixHomeView.swift
//  LibraryApp
//
//  Created by Guest User on 11/01/2025.
//

import SwiftUI

struct NetflixHomeView: View {
    var body: some View
    {
        ZStack{
            Color.netflixBlack.ignoresSafeArea()
            
            VStack(spacing: 0){
                header
                    .padding(.horizontal, 16)
                
                Spacer()
            }
            .foregroundColor(.white)
        }
    }
    
    private var header: some View {
        HStack(spacing: 0){
            Text("For You")
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            
                
            
            HStack(spacing: 16) {
                Image(systemName: "tv.badge.wifi")
                    .onTapGesture {
                        
                    }
                Image(systemName: "magnifyingglass")
                    .onTapGesture {
                        
                    }
            }
            .font(.title2)
        }
    }
    
}

#Preview {
    NetflixHomeView()
}
