//
//  MainView.swift
//  MarketApp
//
//  Created by 홍태희 on 2022/10/25.
//

import SwiftUI


struct MainView: View {
//    @EnvironmentObject var mockData: mockData

    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: true){
//                NavigationView {
//
//                }
                ProductViews()
            }
            .navigationTitle("Togather App")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    private func ProductViews() -> some View {
        ScrollView(.horizontal, showsIndicators: false) {
            ForEach(0..<4) { _ in
                LazyHStack {
                    ForEach(0..<2) { _ in
                        NavigationLink(destination: ProductView()){
                            LazyVStack {
                                AsyncImage(url: URL(string: "https://image.msscdn.net/images/prd_img/20201112/1688130/detail_1688130_1_500.jpg?t=20210907153039"), content: { image in
                                            image.resizable()
                                }, placeholder: {
                                    ProgressView()
                                })
                                .frame(width: 160, height: 200)
                                Spacer()
                                
                                Text("Maison Kitsune")
                                    .font(.system(size: 12, weight: .bold, design: .serif))
                                    .foregroundColor(.black)
                                    .frame(width: 160, height: 20, alignment: .leading)
                                Text("더블 폭스 패치 스니커즈")
                                    .font(.system(size: 13, weight: .medium, design: .serif))
                                    .foregroundColor(.black)
                                    .frame(width: 160, height: 20, alignment: .leading)
                                Text("281,000원")
                                    .font(.system(size: 12, weight: .bold, design: .serif))
                                    .foregroundColor(.black)
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

