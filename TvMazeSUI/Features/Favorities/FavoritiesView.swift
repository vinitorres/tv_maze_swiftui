//
//  FavoritiesView.swift
//  TvMazeSUI
//
//  Created by Vini on 16/04/24.
//

import SwiftUI

struct FavoritiesView: View {
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    @State var searchText = ""
    @State var isSearch = false
    
    var body: some View {
        NavigationView {
            VStack {
            
                LazyVGrid(columns: columns, spacing: 4) {
                    ForEach(1...3, id: \.self) { value in
                        TvShowView()
                    }
                }
                .padding()
            }
            .navigationBarTitle("Favorities")
        }
        .foregroundColor(.black)

    }
}

#Preview {
    FavoritiesView()
}
