//
//  ProductView.swift
//  MarketApp
//
//  Created by 홍태희 on 2022/10/25.
//

import SwiftUI
import UIKit
import Kingfisher

struct ProductView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @StateObject var viewModel: MainShoesViewModel = MainShoesViewModel()
    
    @State private var likeThis = false
    @State private var buyThis = false
    @State private var showShareSheet: Bool = false
    @State private var pageIndex = 0
    @State var bannerSize: CGSize = .zero
    
    var shoesDetail : [ShoesDetailData]
    
    let shareImage = UIImage(named: "appIcon")
    let transName: String
    
    var body: some View {
        
        if !transName.isEmpty {
            VStack {
                ScrollView(.vertical, showsIndicators: true) {
                    
                    productTopImageView()
                    
                    productInfoView(transName: transName)
                    
                    DetailImageView(transName: transName)
                }
                .bounce(false)
                
                .onAppear {
                    print("신발 이름 \(transName)")
                    viewModel.shoesName = transName
                    viewModel.mainDetailShoesRequest()
                }
            }
            .navigationBarBackButtonHidden(true)
            .navigationTitle("")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    shareButton()
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    customBackButton()
                }
            }
        } else {
            LottieLoadingView()
        }
    }
    
    //MARK: - 상단 mock 이미지
    @ViewBuilder
    private func topImage() -> some View {
        VStack {
            Image("shoes")
                .resizable()
                .frame(height: 350)
        }
    }
    
    @ViewBuilder
    private func productTopImageView() -> some View {
        if let shoesDetail = viewModel.shoesDetailData {
            let filteredShoesDetail = shoesDetail.filter { $0.transName == self.transName }
            if !filteredShoesDetail.isEmpty {
                let imageUrls = filteredShoesDetail.first?.productImg ?? []
                ACarousel(imageUrls
                          , id: \.self
                          , index: $pageIndex
                          , spacing: 10
                          , headspace: 0
                          , sidesScaling: 1
                          , autoScroll: .active(5)) { imageUrl in
                    ProductImage(image: imageUrl)
                }
                .frame(height: 300)
                .readSize {
                    bannerSize = $0 }
                
                
                VStack(spacing: 10) {
                    PagerIndicator(selectedPage: $pageIndex
                                   , size: 8, activeColor: Color.colorAsset.blueGray
                                   , inactiveColor: Color.colorAsset.lightBlack
                                   , pageCount: imageUrls.count)
                        .padding(.bottom, 20)
                }
                .transition(.opacity.animation(.easeInOut(duration: 0.5)))
            } else {
                Text("No data found.")
                    .foregroundColor(.secondary)
            }
        }
    }

    //MARK: 배너 이미지 view
    @ViewBuilder
    private func ProductImage(image: String) -> some View {
        KFImage(URL(string: image))
            .resizable()
            .loadDiskFileSynchronously()
            .scaledToFill()
            .frame(height: 300)
    }

    //MARK: - 공유 버튼
    @ViewBuilder
    private func shareButton() -> some View {
        HStack {
            Image(systemName: "arrow")
            
            Button {
                showShareSheet.toggle()
            } label: {
                Image(systemName: "square.and.arrow.up")
                    .frame(width: 20, height: 28)
                    .foregroundColor(.black)
            }
            .sheet(isPresented: $showShareSheet) {
                if let image  = shareImage {
                    ShareView(activityItems: [image])
                        .presentationDetents([.height(UIScreen.screenHeight / 2)])
                } else {
                    ShareView(activityItems: [shareImage ?? nil])
                        .presentationDetents([.height(UIScreen.screenHeight / 2)])
                }
            }
        }
    }
    
    //MARK: - 뒤로 가기 버튼
    @ViewBuilder
    private func customBackButton() -> some View {
        Button {
            self.presentationMode.wrappedValue.dismiss()
        } label: {
            Image(systemName: "chevron.left")
                .frame(width: 30, height: 30)
                .foregroundColor(Color.colorAsset.lightBlack)
        }
        
    }
    
    //MARK: - 가격및 info 화면
    @ViewBuilder
    private func productInfoView(transName: String) -> some View {
        if let shoesDetailData = viewModel.shoesDetailData?.filter({ $0.transName == transName }).first {
            HStack {
                VStack {
                    Text(shoesDetailData.productName ?? "")
                        .nanumSquareNeo(family: .eHv, size: 15, color: Color.colorAsset.lightBlack)
                        .frame(width: 250, height: 20, alignment: .leading)
                        .minimumScaleFactor(0.6)
                    Text(shoesDetailData.transName ?? "")
                        .nanumSquareNeo(family: .dEb, size: 15, color: Color.colorAsset.lightBlack)
                        .frame(width: 250, height: 20, alignment: .leading)
                        .minimumScaleFactor(0.6)
                    
                    HStack {
                        Text(shoesDetailData.price ?? "")
                            .nanumSquareNeo(family: .dEb, size: 15, color: Color.colorAsset.lightBlack)
                            .minimumScaleFactor(0.6)
                        
                        Text("원")
                            .nanumSquareNeo(family: .dEb, size: 15, color: Color.colorAsset.lightBlack)
                            .minimumScaleFactor(0.6)
                        
                    }
                    .frame(width: 250, height: 20, alignment: .leading)
                }
                
                Spacer()
                
                VStack(alignment: .center) {
                    Button(action: {
                        //좋아요 액션 ( 클릭시 heart.fill )
                    }) {
                        Image(systemName: "heart")
                            .resizable()
                            .renderingMode(.original)
                            .frame(width: 30, height: 30)
                    }
                    
                    Text("LIKE")
                        .font(.system(size: 18, weight: .medium, design: .default))
                }.frame(width: 50)
            }
            .padding()
        } 
    }
    
    @ViewBuilder
    private func ProductImageInfo(transName: String) -> some View {
        if let shoesDetailData = viewModel.shoesDetailData?.filter({ $0.transName == transName }).first {
            ForEach(shoesDetailData.productImg, id: \.self) { item in
                KFImage(URL(string: item))
                
            }
        }
    }
}

struct ProductView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ProductView(shoesDetail: dev.shoesDetailData, transName: "나이키 덩크 로우 레트로 그레이 포그")
        }
    }
}
