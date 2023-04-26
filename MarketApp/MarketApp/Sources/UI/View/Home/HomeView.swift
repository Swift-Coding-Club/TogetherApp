//
//  MainView.swift
//  MarketApp
//
//  Created by 홍태희 on 2022/10/25.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel: MainShoesViewModel = MainShoesViewModel()
    
    @State private var sortList = demoSort.one
    @State private var pageIndex = 0
    @State var bannerSize: CGSize = .zero
    @State private var selectPage : Int = .zero
    
    @State private var showABCView: Bool = false
    @State private var showNikeView:  Bool = false
    @State private var showAddidasView: Bool = false
    @State private var loadingABCView: Bool = false
    @State private var loadingNikeView: Bool = false
    @State private var loadingAddidasView: Bool = false
    
    @State private var selectBrandType: BrandType = .all
    @State private var filterBrand: [ShoesDetailData] = []
    
    @State var path = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $path.self) {
            VStack {
                
                leadingNavigationTrallingView()
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    BannerView()
                    
                    CategoryViews()
                        .padding()
                    
                    SelectBrandProductVIew()
                }
                .bounce(false)
            }
        }
        .navigationTitle("")
        .navigationDestination(isPresented: $showABCView) {
            WebViews(url: BannerImages.abcMarket.bannerURL, loading: $loadingABCView)
        }
        
        .navigationDestination(isPresented: $showNikeView) {
            WebViews(url: BannerImages.nikeMarket.bannerURL, loading: $loadingNikeView)
        }
        
        .navigationDestination(isPresented: $showAddidasView) {
            WebViews(url: BannerImages.addidasMarket.bannerURL, loading: $loadingAddidasView)
        }
        
        .onAppear {
            viewModel.mainShoesRequest()
        }
        
        .onChange(of: selectBrandType) { newValue in
            filterBrand =  viewModel.shoesDetailData?.filter({ shoes  in
                shoes.brandName == selectBrandType.brandDescription
            }) ?? []
        }
    }
    //MARK: - 검색 뷰 &  장바구니 뷰
    @ViewBuilder
    private func leadingNavigationTrallingView() -> some View {
        HStack {
            Spacer()
                .frame(width:  UIScreen.screenWidth / 3 - 10)
            
            
            Text("Affinity")
                .nanumSquareNeo(family: .bRG, size: 20, color: Color.colorAsset.lightBlack)
                .frame(width: 130)
            
            Spacer()
            
            ForEach(HomeViewNavigaionItem.allCases, id: \.description) { item in
                if item == .search {
                    NavigationLink(destination: NaviagationSearchView()){
                        Image(systemName: item.image).resizable()
                            .frame(width: 25, height: 25, alignment: .trailing)
                            .foregroundColor(.black)
                    }
                }
            }
            // else if item == .cart {
            //                    NavigationLink(destination: CartView()){
            //                        Image(systemName: item.image ).resizable()
            //                            .frame(width: 25, height: 25, alignment: .trailing)
            //                            .foregroundColor(.black)
            //                    }
            //                }
        }
        .padding(.horizontal)
        .frame(width: UIScreen.screenWidth)
        
    }
    
    //MARK:  - 알림 뷰
    @ViewBuilder
    private func notiNavigationView() -> some View {
        NavigationLink(destination: NotiView()){
            Image(systemName: "bell").resizable()
                .frame(width: 25, height: 25, alignment: .trailing)
                .foregroundColor(.black)
        }
    }
    
    @ViewBuilder
    private func BannerView() -> some View {
        ZStack(alignment: .bottom) {
            ACarousel(BannerImages.allCases
                      , id: \.self
                      , index: $pageIndex
                      , spacing: 10
                      , headspace: 0
                      , sidesScaling: 1
                      , autoScroll: .active(5)) { item in
                BannerImage(image: item.bannerImage)
                    .onTapGesture {
                        if item.description == "ABC" {
                            showABCView = true
                        } else if item.description == "NIKE" {
                            showNikeView = true
                        } else if item.description == "ADDIDAS" {
                            showAddidasView = true
                        }
                    }
            }.frame(height: 240)
                .readSize {
                    bannerSize = $0
                }
            
            VStack(spacing: 10) {
                PagerIndicator(selectedPage: $pageIndex
                               , size: 8
                               , activeColor: Color.colorAsset.blueGray
                               , inactiveColor: Color.colorAsset.lightBlack
                               , pageCount: BannerImages.allCases.count)
                .padding(.bottom, 20)
            }
        }
    }
    
    //MARK: 배너 이미지 view
    @ViewBuilder
    private func BannerImage(image: String)  -> some View {
        Image(image)
            .resizable()
            .scaledToFill()
            .frame(height: 200)
    }
    
    //MARK: - 카테고리 view
    @ViewBuilder
    private func CategoryViews() -> some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack {
                ForEach(BrandType.allCases, id: \.rawValue) { item in
                    Button(item.description) {
                        withAnimation(.easeInOut) {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                                self.selectBrandType = item
                            }
                        }
                    }
                    .tag(selectBrandType.brandDescription)
                    
                    .nanumSquareNeo(family: .cBd, size: 15, color: Color.colorAsset.white)
                    .frame(width: 110, height: 40, alignment: .center)
                    .background(Color.colorAsset.black)
                    .cornerRadius(12)
                }
            }
        }
    }
    
    //MARK: - 리스트 뷰
    @ViewBuilder
    private func ProductView() -> some View {
        LazyVStack {
            if let shoesData = viewModel.shoesDetailData {
                ProdductListView(shoesData: shoesData)
            } else {
                LottieLoadingView()
                    .onAppear {
                        viewModel.mainShoesRequest()
                    }
            }
        }
    }
        
        @ViewBuilder
        private func SelectBrandProductView() -> some View {
            LazyVStack {
                if filterBrand != nil {
                    ProdductListView(shoesData: filterBrand)
                } else {
                    LottieLoadingView()
                }
            }
        }
        
        @ViewBuilder
        private func SelectBrandProductVIew() -> some View {
            if selectBrandType == .all {
                ProductView()
            } else if selectBrandType.brandDescription == BrandType.nike.brandDescription {
                SelectBrandProductView()
            } else if selectBrandType.brandDescription == BrandType.adidas.brandDescription {
                SelectBrandProductView()
            } else if selectBrandType.brandDescription == BrandType.converse.brandDescription {
                SelectBrandProductView()
            } else if selectBrandType.brandDescription ==  BrandType.jordan.brandDescription{
                SelectBrandProductView()
            } else if selectBrandType.brandDescription == BrandType.miharaYasuhiro.brandDescription {
                SelectBrandProductView()
            } else if selectBrandType.brandDescription == BrandType.newBalance.brandDescription {
                SelectBrandProductView()
            } else {
                ProductView()
            }
        }
    }
    
    struct HomeView_Previews: PreviewProvider {
        static var previews: some View {
            NavigationStack {
                HomeView(viewModel: MainShoesViewModel())
            }
        }
    }
    
    
