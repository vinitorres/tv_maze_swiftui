//
//  MoviesGalleryView.swift
//  TvMazeSUI
//
//  Created by Vini on 03/04/24.
//

import SwiftUI

struct TvShowsGalleryView: View {
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    @State var searchText = ""
    @State var isSearch = false
    
    var body: some View {
        NavigationView {
            VStack {
                SearchBar(searchText: $searchText, isSearching: $isSearch)
                LazyVGrid(columns: columns, spacing: 4) {
                    ForEach(1...3, id: \.self) { value in
                        TvShowView()
                    }
                }
                .padding()
            }
            .navigationBarTitle("Tv Shows")
        }
        .foregroundColor(.black)

    }
}

struct TvShowView: View {
    
    let title = "Spider-Man"
    let urlImage = "https://uauposters.com.br/media/catalog/product/cache/1/thumbnail/800x930/9df78eab33525d08d6e5fb8d27136e95/3/5/358620210407-uau-posters-homem-aranha-spider-man-tobey.jpg"
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: urlImage)) { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(height: 260)
                                
            
            
            Text(title)
                .foregroundColor(.white)
                 .font(.headline)
                 .multilineTextAlignment(.center)
        }
        
    }
}

struct SearchBar: View {
    @Binding var searchText: String
    @Binding var isSearching: Bool

    var body: some View {
        HStack {
            TextField("Search ...", text: $searchText)
                .padding(.leading, 24)
                .padding(.vertical, 8)
                .padding(.trailing, 10)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .padding(.horizontal)
                .onTapGesture {
                    isSearching = true
                }

            if isSearching {
                Button(action: {
                    searchText = ""
                    isSearching = false
                }) {
                    Image(systemName: "xmark.circle.fill")
                        .padding(.vertical)
                }
                .padding(.trailing)
                .transition(.move(edge: .trailing))
                .animation(.easeInOut)
            }
        }
    }
}



#Preview {
    TvShowsGalleryView()
}
