//
//  MainView.swift
//  MarketApp
//
//  Created by 홍태희 on 2022/10/25.
//

import SwiftUI

struct MainView: View {
    
    @State private var showDetail = false
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                CategoryViews()
                    .padding()
                
                ProductViews()
            }
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
    
    @ViewBuilder
    private func CategoryViews() -> some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack {
                ForEach(0..<10) { _ in
                    Button("종류") {
                        //Action Here.
                    }
                    .font(.system(size: 15, weight: .bold))
                    .frame(width: 70, height: 40, alignment: .center)
                    .background(Color.black)
                    .foregroundColor(.white)
                    .cornerRadius(12)
                }
            }
        }
    }
    
    @ViewBuilder
    private func ProductViews() -> some View {
        ScrollView(.horizontal, showsIndicators: false) {
            ForEach(0..<10) { _ in
                LazyHStack {
                    ForEach(0..<2) { _ in
                        NavigationLink(destination: ProductView()){
                            LazyVStack {
                                Image("shoes")
                                    .resizable()
                                    .frame(width: 160, height: 200, alignment: .center)
                                Text("Maison Kitsune")
                                    .font(.system(size: 12, weight: .bold, design: .monospaced))
                                    .frame(width: 160, height: 20, alignment: .leading)
                                Text("더블 폭스 패치 스니커즈")
                                    .font(.system(size: 13, weight: .medium, design: .default))
                                    .frame(width: 160, height: 20, alignment: .leading)
                                Text("281,000원")
                                    .font(.system(size: 12, weight: .bold, design: .monospaced))
                                    .frame(width: 160, height: 20, alignment: .leading)
                            }
                            .padding(15)
                        }
                    }
                }
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

