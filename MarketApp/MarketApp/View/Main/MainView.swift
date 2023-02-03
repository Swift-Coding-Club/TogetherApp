//
//  MainView.swift
//  MarketApp
//
//  Created by 홍태희 on 2022/10/25.
//

import SwiftUI

struct MainView: View {
    
    @State private var sortList = demoSort.one
    @StateObject var viewModel: MainShoesViewModel = MainShoesViewModel()
    
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            BannerViews()
            
            CategoryViews()
                .padding()
            
            SortedViews()
            
            ProdductListView()
        }
        .bounce(false)
    }
    
    @ViewBuilder
    private func BannerViews() -> some View {
        TabView {
            ForEach(demoImage.allCases, id: \.self) { image in
                ZStack {
                    Image(image.rawValue)
                        .frame(maxWidth: .infinity, minHeight: 250)
                        .aspectRatio(contentMode: .fit)
                        .tag(image)
                }
            }
        }
        .tabViewStyle(.page(indexDisplayMode: .always))
        .frame(maxWidth: .infinity, minHeight: 250)
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


