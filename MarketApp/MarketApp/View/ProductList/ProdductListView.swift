//
//  ProdductListView.swift
//  MarketApp
//
//  Created by 서원지 on 2023/02/01.
//

import SwiftUI
import Kingfisher

struct ProdductListView: View {
    @State private var btnTaped = false
    @State private var btnCount = 1
    var shoesData: ShoeResponse
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 30) {
                ForEach(shoesData.data ?? []) { item in
                    gridList(image: item.image ?? "", name: item.transName ?? "", price: item.price ?? "", engName: item.productName ?? "")
                }
            }
        }
        .bounce(false)
        .padding(.horizontal)
    }
    
    @ViewBuilder
    private func gridList(image: String, name: String, price: String,  engName: String) -> some View {
        NavigationLink(destination: ProductView()){
            LazyVStack(spacing: 5) {
                ZStack(alignment: .bottomTrailing) {
                    KFImage(URL(string: image))
                        .resizable()
                        .frame(width: 160, height: 200, alignment: .center)
                    
                }
                
                Text(name)
                    .nanumSquareNeo(family: .cBd, size: 13, color: .black)
                    .frame(width: 160, height: 20, alignment: .leading)
                Text(engName)
                    .nanumSquareNeo(family: .cBd, size: 13, color: .black)
                    .frame(width: 160, height: 20, alignment: .leading)
                Text(price + "원")
                    .nanumSquareNeo(family: .bRG, size: 13, color: .black)
                    .frame(width: 160, height: 20, alignment: .leading)
            }
        }
    }
}

struct ProdductListView_Previews: PreviewProvider {
    static var previews: some View {
        ProdductListView(shoesData: dev.shoesData)
    }
}
