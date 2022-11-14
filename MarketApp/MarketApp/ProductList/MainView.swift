//
//  MainView.swift
//  MarketApp
//
//  Created by 홍태희 on 2022/10/25.
//

import SwiftUI

enum demoImage : String, CaseIterable {
    case one = "blue"
    case two = "pink"
    case three = "yellow"
}

struct MainView: View {
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                BannerViews()
                
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
    private func BannerViews() -> some View {
        TabView {
            ForEach(demoImage.allCases, id: \.self) { image in
                Image(image.rawValue)
                    .frame(maxWidth: .infinity, minHeight: 250)
                    .aspectRatio(contentMode: .fit)
            }
        }
        .tabViewStyle(.page(indexDisplayMode: .always))
        .frame(maxWidth: .infinity, minHeight: 250)
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
}

struct ProductViews : View {
    
    @State private var showDetail = false
    
    @State private var btnTaped = false
    @State private var btnCount = 1

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            ForEach(0..<10) { _ in
                LazyHStack {
                    ForEach(0..<2) { _ in
                        //MARK : heartBtn이 NavigationLink에 묻혀서 임시로 텍스트에만 링크를 달았다.
                        LazyVStack(spacing: 5) {
                            ZStack(alignment: .bottomTrailing) {
                                Image("shoes")
                                    .resizable()
                                    .frame(width: 160, height: 200, alignment: .center)
                                Button(action: {
                                    btnCount += 1
                                    if btnCount%2 == 0 {
                                        btnTaped = true
                                    } else {
                                        btnTaped = false
                                    }
                                }, label: {
                                    if btnTaped {
                                        Image(systemName: "heart.fill")
                                            .resizable()
                                            .renderingMode(.original)
                                            .frame(width: 30, height: 30)
                                            .padding()
                                    } else {
                                        Image(systemName: "heart")
                                            .resizable()
                                            .renderingMode(.original)
                                            .frame(width: 30, height: 30)
                                            .padding()
                                    }
                                })
                            }
                            NavigationLink(destination: ProductView()){
                                LazyVStack {
                                    Text("Maison Kitsune")
                                        .font(.system(size: 12, weight: .bold, design: .monospaced))
                                        .foregroundColor(.black)
                                        .frame(width: 160, height: 20, alignment: .leading)
                                    Text("더블 폭스 패치 스니커즈")
                                        .font(.system(size: 13, weight: .medium, design: .default))
                                        .foregroundColor(.black)
                                        .frame(width: 160, height: 20, alignment: .leading)
                                    Text("281,000원")
                                        .font(.system(size: 12, weight: .bold, design: .monospaced))
                                        .foregroundColor(.black)
                                        .frame(width: 160, height: 20, alignment: .leading)
                                }
                            }
                        }
                        .padding(15)
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

