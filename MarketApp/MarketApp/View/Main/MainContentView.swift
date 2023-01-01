//
//  MainContentView.swift
//  MarketApp
//
//  Created by 홍태희 on 2022/10/25.
//

import SwiftUI

struct MainContentView: View {
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
            .navigationBarItems(trailing: leadingNavigationTrallingView())
            .navigationBarItems(leading: notiNavigationView())
        }
       
    }
    //MARK: - 검색 뷰 &  장바구니 뷰
    @ViewBuilder
    private func leadingNavigationTrallingView() -> some View {
        HStack{
            ForEach(MainNavigaionItem.allCases, id: \.description) { item in
                if item == .search {
                    NavigationLink(destination: SearchView()){
                        Image(systemName: item.image).resizable()
                            .frame(width: 25, height: 25, alignment: .trailing)
                            .foregroundColor(.black)
                    }
                } else if item == .cart {
                    NavigationLink(destination: CartView()){
                        Image(systemName: item.image ).resizable()
                            .frame(width: 25, height: 25, alignment: .trailing)
                            .foregroundColor(.black)
                    }
                }
            }
        }
    }
    //MARK:  - 알림 뷰
    @ViewBuilder
    private func notiNavigationView() -> some View {
        NavigationLink(destination: NotiView()){
            Image(systemName: "bell").resizable()
                .frame(width: 25, height: 25, alignment: .trailing)
                .foregroundColor(.black)
        }
    }
}

struct MainContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .previewDevice("iPhone 12")
    }
}
