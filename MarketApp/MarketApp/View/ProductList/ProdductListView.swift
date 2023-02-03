//
//  ProdductListView.swift
//  MarketApp
//
//  Created by 서원지 on 2023/02/01.
//

import SwiftUI

struct ProdductListView: View {
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
        }
        .bounce(false)
        .padding(.horizontal)
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

struct ProdductListView_Previews: PreviewProvider {
    static var previews: some View {
        ProdductListView()
    }
}
