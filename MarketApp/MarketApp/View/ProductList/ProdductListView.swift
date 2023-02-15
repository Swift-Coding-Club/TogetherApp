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
    var shoesData: [ShoeData]
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 30) {
                ForEach(shoesData) { item in
                    gridList(image: item.image ?? "", transName: item.transName ?? "", price: item.price ?? "", productName: item.productName ?? "")
                }
            }
            
            Spacer()
        }
        .bounce(false)
        .padding(.horizontal)
    }
    
    @ViewBuilder
    private func gridList(image: String, transName: String, price: String,  productName: String) -> some View {
        NavigationLink(destination: ProductView()){
            LazyVStack(spacing: 5) {
                KFImage(URL(string: image))
                    .resizable()
                    .frame(width: 160, height: 200, alignment: .leading)
                
                Text(transName)
                    .nanumSquareNeo(family: .cBd, size: 13, color: .black)
                    .frame(width: 160, height: 20, alignment: .leading)
                    .lineLimit(1)
                
                Text(productName)
                    .nanumSquareNeo(family: .cBd, size: 13, color: .black)
                    .frame(width: 160, height: 20, alignment: .leading)
                    .lineLimit(1)

                Text(price + "원")
                    .nanumSquareNeo(family: .cBd, size: 13, color: .black)
                    .frame(width: 160, height: 20, alignment: .leading)
                    .lineLimit(1)
                   
            }
        }
    }
}

struct ProdductListView_Previews: PreviewProvider {
    static var previews: some View {
        ProdductListView(shoesData: dev.shoesData.data ?? [])
    }
}
