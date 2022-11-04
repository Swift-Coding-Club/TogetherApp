//
//  ContentView.swift
//  MarketApp
//
//  Created by 홍태희 on 2022/10/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            ProductDetailView()
                .tabItem{
                    Image(systemName: "house.fill")
                    Text("Home")
                }
            ProductListView()
                .tabItem{
                    Image(systemName: "list.bullet.rectangle")
                    Text("Product")
                }
            FavoriteView()
                .tabItem{
                    Image(systemName: "heart.fill")
                    Text("Favorite")
                }
            ProfileView()
                .tabItem{
                    Image(systemName: "person.crop.circle")
                    Text("Profile")
                }
        }
        .accentColor(.black)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
