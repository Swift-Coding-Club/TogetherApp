//
//  HomeView.swift
//  MarketApp
//
//  Created by Keum MinSeok on 2022/11/05.
//

import SwiftUI

struct HomeView: View {
    @State private var showDetail = false
        
        var body: some View {
            NavigationView {
                ScrollView(.vertical, showsIndicators: false) {
                    CategoryView()
                    
                    ProductView()
                }
                .navigationTitle("App Name")
                .font(.system(size: 24, weight: .semibold))
                .navigationBarTitleDisplayMode(.inline)
                
                .navigationBarItems(leading: NavigationLink(destination: NotiView()){
                    Image(systemName: "bell")
                        .resizable()
                        .frame(width: 25, height: 25, alignment: .trailing)
                })
                .foregroundColor(.black)
                
                .navigationBarItems(trailing: NavigationLink(destination: CartView()){
                    Image(systemName: "cart")
                        .resizable()
                        .frame(width: 25, height: 25, alignment: .trailing)
                })
                .foregroundColor(.black)
                
                .navigationBarItems(trailing: NavigationLink(destination: SearchView()){
                    Image(systemName: "magnifyingglass")
                        .resizable()
                        .frame(width: 25, height: 25, alignment: .trailing)
                })
                .foregroundColor(.black)
            }
        }
    }

// MARK: - Category

private extension HomeView {
    private func CategoryView() -> some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack {
                ForEach(0..<10) { _ in
                    Button("카테고리") {
                    }
                    .font(.system(size: 15, weight: .bold))
                    .frame(width: 70, height: 40, alignment: .center)
                    .background(Color.black)
                    .foregroundColor(.white)
                    .cornerRadius(12)
                }
            }
        }
        .padding(.vertical, 20)
        .padding(.horizontal, 10)
    }
}

// MARK: - Product List

private extension HomeView {
    private func ProductView() -> some View {
        ForEach(0..<10) { _ in
            LazyHStack(spacing: 0) {
                ForEach(0..<2) { _ in
                    NavigationLink(destination: ProductDetailView()){
                        LazyVStack(spacing: 0) {
                            Image("Nike")
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
                        .padding(.horizontal, 10)
                        .padding(.bottom, 15)
                    }
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
