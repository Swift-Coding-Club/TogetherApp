//
//  ListView.swift
//  MarketApp
//
//  Created by 홍태희 on 2022/10/25.
//

import SwiftUI

struct ListView: View {
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                ProductViews()
            }
            .navigationTitle("App Name")
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

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
