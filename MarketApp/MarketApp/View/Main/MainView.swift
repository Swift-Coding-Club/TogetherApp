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
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            BannerView()
            
            CategoryViews()
                .padding()
            
            SortedViews()
            
            ProdductListView()
        }
        .bounce(false)
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
                      , isWrap: true
                      , autoScroll: .active(5) ) { item in
                BannerImage(image: item)
            }
            .frame(height: 200)
            
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
                ForEach(0..<10) { _ in
                    Button("종류") {
                        //Action Here.
                    }
                    .font(.system(size: 15, weight: .bold))
                    .frame(width: 70, height: 40, alignment: .center)
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
        MainView(viewModel: MainShoesViewModel())
    }
}


