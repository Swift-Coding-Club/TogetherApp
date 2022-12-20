//
//  ContentView.swift
//  MarketApp
//
//  Created by 홍태희 on 2022/10/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
                    TabView {
                        MainView()
                            .tabItem{
                                Image(systemName: "house.fill")
                                Text("Home")
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
                    .navigationTitle("APP NAME")
                    .navigationBarTitleDisplayMode(.inline)
                    .navigationBarItems(trailing: NavigationLink(destination: CartView()){
                        Image(systemName: "cart").resizable()
                            .frame(width: 25, height: 25, alignment: .trailing)
                    }).foregroundColor(.black)
                    .navigationBarItems(trailing: NavigationLink(destination: SearchView()){
                        Image(systemName: "magnifyingglass").resizable()
                            .frame(width: 25, height: 25, alignment: .trailing)
                    }).foregroundColor(.black)
                    .navigationBarItems(leading: NavigationLink(destination: NotiView()){
                        Image(systemName: "bell").resizable()
                            .frame(width: 25, height: 25, alignment: .trailing)
                    }).foregroundColor(.black)
                }
            }
        }

        struct ContentView_Previews: PreviewProvider {
            static var previews: some View {
                ContentView()
                    .previewDevice("iPhone 12")
            }
        }
