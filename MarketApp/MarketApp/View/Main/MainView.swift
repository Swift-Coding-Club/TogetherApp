//
//  MainView.swift
//  MarketApp
//
//  Created by 홍태희 on 2022/10/25.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = ShoeNetwork()
    
    @State private var sortList = demoSort.one
    @State private var pageIndex = 0
    @State var bannerSize: CGSize = .zero
    @State private var selectPage : Int = .zero
    
    @State var path = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $path.self) {
            VStack {
                
                leadingNavigationTrallingView()
                
                ScrollView(.vertical, showsIndicators: false) {
                    BannerView()
                    
                    CategoryViews()
                        .padding()
                    
                    SortedViews()
                    
                    //W : Problem ( 여기다 bp찍으면 광고배너 움직일때마다 걸림.
                    ForEach(viewModel.shoe) { item in
                        ProdductListView(shoesData: [item])
                    }
                }
                .bounce(false)
            }
        }
        .navigationTitle("")
//        .onAppear {
//            viewModel.shoe
//        }
    }
    //MARK: - 검색 뷰 &  장바구니 뷰
    @ViewBuilder
    private func leadingNavigationTrallingView() -> some View {
        HStack {
            Spacer()
                .frame(width:  UIScreen.screenWidth / 3 - 10)
            
            
            
            Text("Affinity")
                .nanumSquareNeo(family: .bRG, size: 20, color: .black)
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
                      , sidesScaling: 0.7
                      , autoScroll: .active(5)) { item in
                BannerImage(image: item)
            }.frame(height: 200)
                .readSize {
                    bannerSize = $0
                }
            
            VStack(spacing: 10) {
                PagerIndicator(selectedPage: $pageIndex
                               , size: 8
                               , activeColor: .gray
                               , inactiveColor: .black.opacity(0.3)
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
                ForEach(BrandName.allCases, id: \.description) { item in
                    Button(item.description) {
                        //Action Here.
                    }
                    .font(.system(size: 15, weight: .bold))
                    .frame(width: 110, height: 40, alignment: .center)
                    .background(Color.black)
                    .foregroundColor(.white)
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
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            MainView(viewModel: ShoeNetwork())
        }
    }
}


