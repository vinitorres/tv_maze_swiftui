//
//  MainNavigation.swift
//  TvMazeSUI
//
//  Created by Vini on 16/04/24.
//

import SwiftUI

struct MainNavigationView: View {
    @State private var selectedTab = 0
    
    var body: some View {
        TabView(selection: $selectedTab) {
            
            TvShowsGalleryView()
            .tabItem {
                Image(systemName: "magnifyingglass")
                Text("Tv Shows")
            }
            .tag(0)
            
            FavoritiesView()
            .tabItem {
                Image(systemName: "star")
                Text("Favorities")
            }
            .tag(1)
        }
    }
}

#Preview {
    MainNavigationView()
}
