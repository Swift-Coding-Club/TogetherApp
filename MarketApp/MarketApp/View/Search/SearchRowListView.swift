//
//  SearchRowListView.swift
//  MarketApp
//
//  Created by 서원지 on 2023/03/04.
//

import SwiftUI
import Kingfisher

struct SearchRowListView: View {
    let shoesData: [ShoeData]
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 30) {
                ForEach(shoesData) { item in
                    gridList(image: item.image ?? "", brandName: item.brandName ?? "", price: item.price ?? "", productName: item.transName ?? "")
                }
            }
            
            Spacer()
        }
        .bounce(false)
        .padding(.horizontal)
    }
    
    @ViewBuilder
    private func gridList(image: String, brandName: String, price: String,  productName: String) -> some View {
        NavigationLink(destination: ProductView()){
            LazyVStack(spacing: 5) {
                KFImage(URL(string: image))
                    .resizable()
                    .frame(width: 160, height: 200, alignment: .leading)
                
               Text(brandName)
                    .nanumSquareNeo(family: .cBd, size: 12, color: .black)
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

struct SearchRowListView_Previews: PreviewProvider {
    static var previews: some View {
        SearchRowListView(shoesData:  dev.shoesData)
    }
}
