//
//  ProductInfoImage.swift
//  MarketApp
//
//  Created by 서원지 on 2023/03/19.
//

import SwiftUI
import Kingfisher


struct ProductInfoImage: View {
    var selectProductInfoTap : DetailTapInfo
    @StateObject var viewModel: MainShoesViewModel = MainShoesViewModel()
    let transName: String
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            switch selectProductInfoTap {
            case .info:
                ProductImageInfo(transName: transName)
                
            case .community:
                CommunityView()
            }
        }
       
    }
    
    
    
    @ViewBuilder
    private func ProductImageInfo(transName: String) -> some View {
        if let shoesDetailData = viewModel.shoesDetailData?.filter({ $0.transName == transName }).first {
            ForEach(shoesDetailData.productImg, id: \.self) { item in
                KFImage(URL(string: item))
                    .loadDiskFileSynchronously()
                    .resizable()
                    .frame(maxWidth: 350, minHeight: 500)
            }.onAppear {
                viewModel.shoesName = shoesDetailData.transName
            }
            
        } else {
        ProgressView()
                .onAppear {
                    viewModel.mainDetailShoesRequest()
            }
        }
    }
}

struct ProductInfoImage_Previews: PreviewProvider {
    static var previews: some View {
        ProductInfoImage(selectProductInfoTap: .info, transName: "(W) 나이키 덩크 로우")
    }
}
