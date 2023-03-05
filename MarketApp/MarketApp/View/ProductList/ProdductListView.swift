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
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(shoesData) { item in
                    gridList(image: item.image ?? "", transName: item.transName ?? "", price: item.price ?? "", productName: item.productName ?? "")
                }
            }
            
            Spacer()
        }
        .bounce(false)
        .padding(.horizontal, 10)
    }
    
    @ViewBuilder
    private func gridList(image: String, transName: String, price: String,  productName: String) -> some View {
        NavigationLink(destination: ProductView()){
            LazyVStack(alignment: .listRowSeparatorLeading, spacing: 5) {
                KFImage(URL(string: image))
                    .resizable()
                    .frame(width: 160, height: 200, alignment: .leading)
                
                Text(transName)
                    .nanumSquareNeo(family: .cBd, size: 13, color: Color.colorAsset.lightBlack)
                    .frame(width: 160, height: 20, alignment: .leading)
                    .minimumScaleFactor(0.7)
                    .lineLimit(1)
                
                Text(productName)
                    .nanumSquareNeo(family: .cBd, size: 13, color: Color.colorAsset.lightBlack)
                    .frame(width: 160, height: 20, alignment: .leading)
                    .minimumScaleFactor(0.7)
                    .lineLimit(1)

                Text(price + "원")
                    .nanumSquareNeo(family: .cBd, size: 11, color: Color.colorAsset.lightBlack)
                    .frame(width: 160, height: 20, alignment: .leading)
                    .lineLimit(1)
                    .padding(.bottom)
                   
            }
            .padding(.leading, 8)
            .background {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.colorAsset.lightBlack, lineWidth: 0.3)
            }
        }
    }
}

struct ProdductListView_Previews: PreviewProvider {
    static var previews: some View {
        ProdductListView(shoesData: dev.shoesData)
    }
}
