//
//  InfoView.swift
//  MarketApp
//
//  Created by 홍태희 on 2022/10/28.
//

import SwiftUI
import Kingfisher

struct DetailImageView: View {

    @State private var selectedPicker: DetailTapInfo = .info
    @Namespace private var animation
    @StateObject var viewModel: MainShoesViewModel = MainShoesViewModel()
    let transName: String
    
    
    var body: some View {
        VStack {
            if viewModel.shoesDetailData?.isEmpty != nil {
                
                selectTapAnimate()
                
                selectDetailTapView()
                
            } else {
                
                Spacer()
                    .frame(height: UIScreen.screenHeight / 4 )
                LottieLoadingView()
                    .onAppear {
                        viewModel.mainDetailShoesRequest()
                    }
            }
        }
    }
    
    @ViewBuilder
    private func selectDetailTapView() -> some View {
        ScrollView(.vertical, showsIndicators: false) {
            if selectedPicker == .info {
                productImageInfo(transName: transName)
                
            } else if selectedPicker == .community {
                CommunityView()
            }
        }
        .animation(nil)
    }
    
    
    @ViewBuilder
    private func selectTapAnimate() -> some View {
        HStack {
            ForEach(DetailTapInfo.allCases, id: \.self) { item in
                VStack {
                    Text(item.rawValue)
                        .font(.title3)
                        .frame(maxWidth: .infinity/4, minHeight: 50)
                        .foregroundColor(selectedPicker == item ? .black : .gray)

                    if selectedPicker == item {
                        Capsule()
                            .foregroundColor(.black)
                            .frame(height: 3)
                            .matchedGeometryEffect(id: "info", in: animation)
                    }
                    
                }
                .onTapGesture {
                    withAnimation(.easeInOut) {
                        self.selectedPicker = item
                    }
                }
            }
        }
    }
    
    @ViewBuilder
    private func productImageInfo(transName: String) -> some View {
        if let shoesDetailData = viewModel.shoesDetailData?.filter({ $0.transName == transName }).first {
            ForEach(shoesDetailData.productImg, id: \.self) { imageUrl in
                KFImage(URL(string: imageUrl))
                    .loadDiskFileSynchronously()
                    .resizable()
                    .frame(width: 340, height: 350)
                    .onAppear {
                        viewModel.shoesName = transName
                        viewModel.mainDetailShoesRequest()
                    }
            }
        } else {
//            LottieLoadingView()
//                .onAppear {
//                    viewModel.mainDetailShoesRequest()
//                }
        }
    }

}

struct DetailImageView_Previews: PreviewProvider {
    static var previews: some View {
        DetailImageView(transName: "살로몬 XT-6 ADV 화이트")
    }
}
