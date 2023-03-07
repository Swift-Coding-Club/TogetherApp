//
//  MainView.swift
//  MarketApp
//
//  Created by 홍태희 on 2022/10/25.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel: MainShoesViewModel = MainShoesViewModel()
    
    @State private var sortList = demoSort.one
    @State private var pageIndex = 0
    @State var bannerSize: CGSize = .zero
    @State private var selectPage : Int = .zero
    @State private var showABCView: Bool = false
    @State private var showNikeView:  Bool = false
    
    @State private var selectBrandType: BrandType = .all
    @State private var filterBrand: [ShoeData] = []
    
    @State var path = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $path.self) {
            VStack {
                
                leadingNavigationTrallingView()
                
                ScrollView(.vertical, showsIndicators: false) {
                    BannerView()
                    
                    CategoryViews()
                        .padding()
                    
                    selectBrandProductVIew()
                }
                .bounce(false)
            }
        }
        .navigationTitle("")
        .navigationDestination(isPresented: $showABCView) {
            WebViews(url: BannerImages.abcMarket.bannerURL)
        }
        .navigationDestination(isPresented: $showNikeView) {
            WebViews(url: BannerImages.nikeMarket.bannerURL)
        }
        .onAppear {
            viewModel.mainShoesRequest()
        }
        .onChange(of: selectBrandType) { newValue in
            filterBrand =  viewModel.shoesData?.filter({ shoes  in
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
            
            ForEach(MainNavigaionItem.allCases, id: \.description) { item in
                if item == .search {
                    NavigationLink(destination: NaviagationSearchView()){
                        Image(systemName: item.image).resizable()
                            .frame(width: 25, height: 25, alignment: .trailing)
                            .foregroundColor(.black)
                    }
                }
            }
            //                else if item == .cart {
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
            ACarousel(bannerImages
                      , id: \.self
                      , index: $pageIndex
                      , spacing: 10
                      , headspace: 0
                      , sidesScaling: 1
                      , autoScroll: .active(5)) { item in
                BannerImage(image: item)
                    .onTapGesture {
                        if item == "ABC" {
                            showABCView = true
                        } else if item == "Nike" {
                            showNikeView = true
                        }
                    }
            }.frame(height: 200)
                .readSize {
                    bannerSize = $0
                }
            
            VStack(spacing: 10) {
                PagerIndicator(selectedPage: $pageIndex
                               , size: 8
                               , activeColor: Color.colorAsset.blueGray
                               , inactiveColor: Color.colorAsset.lightBlack
                               , pageCount: bannerImages.count)
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
    
    @ViewBuilder
    private func SortedViews() -> some View {
        Picker("Sort List", selection: $sortList) {
            ForEach(demoSort.allCases, id: \.self) { menu in
                Text(menu.rawValue).tag(menu.rawValue)
                
                //TODO : tag가 변경될때마다 해당 tag에 맞게끔 리스트 정렬 변경 ( default : 인기순 )
            }
        }.pickerStyle(.menu)
    }
    
    @ViewBuilder
    private func productView() -> some View {
        LazyVStack {
            if let shoesData = viewModel.shoesData {
                ProdductListView(shoesData: shoesData)
            }
        }
    }
    
    @ViewBuilder
    private func selectBrandProductView() -> some View {
        LazyVStack {
            if let shoesData = filterBrand {
                ProdductListView(shoesData: shoesData)
            }
        }
    }
    
    @ViewBuilder
    private func selectBrandProductVIew() -> some View {
        if selectBrandType == .all {
            productView()
        } else if selectBrandType.brandDescription == "Nike" {
            selectBrandProductView()
        } else if selectBrandType.brandDescription == "Adidas"{
            selectBrandProductView()
        } else if selectBrandType.brandDescription == "Converse" {
            selectBrandProductView()
        } else if selectBrandType.brandDescription == "Jordan" {
            selectBrandProductView()
        } else if selectBrandType.brandDescription == "Mihara Yasuhiro" {
            selectBrandProductView()
        } else if selectBrandType.brandDescription == "New Balance" {
            selectBrandProductView()
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            MainView(viewModel: MainShoesViewModel())
        }
    }
}


