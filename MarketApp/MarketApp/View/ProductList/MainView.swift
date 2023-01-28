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

enum demoSort : String, CaseIterable {
    case one = "인기순"
    case two = "이름순"
    case three = "가격순"
}

struct MainView: View {
    
    @State private var sortList = demoSort.one
    
    var body: some View {
        NavigationStack {
            ScrollView(.vertical, showsIndicators: false) {
                BannerViews()
                
                CategoryViews()
                    .padding()
                
                SortedViews()
                
                ProductViews()
            }
        }
    }
    
    @ViewBuilder
    private func BannerViews() -> some View {
        TabView {
            ForEach(demoImage.allCases, id: \.self) { image in
                ZStack {
                    Image(image.rawValue)
                        .frame(maxWidth: .infinity, minHeight: 250)
                        .aspectRatio(contentMode: .fit)
                        .tag(image)
                }
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
    
    @ViewBuilder
    private func SortedViews() -> some View {
        Picker("Sort List", selection: $sortList) {
            ForEach(demoSort.allCases, id: \.self) { menu in
                Text(menu.rawValue).tag(menu.rawValue)
                
                //TODO : tag가 변경될때마다 해당 tag에 맞게끔 리스트 정렬 변경 ( default : 인기순 )
            }
        }.pickerStyle(.menu)
    }
}

struct ProductViews : View {
    
    @State private var showDetail = false
    
    @State private var btnTaped = false
    @State private var btnCount = 1
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 30) {
                ForEach(0..<12) { _ in
                    gridList()
                }
            }
        }.padding(.horizontal)
    }
    
    @ViewBuilder
    private func gridList() -> some View {
        NavigationLink(destination: ProductView()){
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
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}


