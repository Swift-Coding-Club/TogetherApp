//
//  ProductInfoImage.swift
//  MarketApp
//
//  Created by 서원지 on 2023/03/19.
//

import SwiftUI

struct ProductInfoImage: View {
    var selectProductInfoTap : DetailTapInfo
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            switch selectProductInfoTap {
            case .info:
                ForEach(0..<5) { _ in
                    Text("블랙컬러")
                        .padding()
                    Image("shoes")
                        .resizable()
                        .frame(maxWidth: 350, minHeight: 500)
                }
                
            case .community:
                ScrollView(showsIndicators: false) {
                    ForEach(0..<7) { _ in
                        CommunityView(nickName: "Zero",
                                       comment: "요즘 매종 키츠네 신발 유행인가요? 알려주세요 :)")
                    }
                }
            }
        }
    }
}

struct ProductInfoImage_Previews: PreviewProvider {
    static var previews: some View {
        ProductInfoImage(selectProductInfoTap: .info)
    }
}
