//
//  SearchView.swift
//  MarketApp
//
//  Created by 홍태희 on 2022/10/25.
//

import SwiftUI

struct SearchView: View {
    @State public var text = ""
    
    var body: some View {
        NavigationView {
            SearchedView(searchText: text)
                .searchable(text: $text)
        }
    }
}

struct SearchedView: View {
    let searchText: String
    
    @Environment(\.isSearching) private var isSearching
    let mockBrandList : [String] = ["Nike","Puma","A.testoni","Reebok","Head","Addidas","Kappa","JDX","ELLE","Armani", "Columbia","H&M","ZARA","LouisVitton","UNIQLO","Hermes","Gucci","UnderArmour"]
    let popularSearchList : [String] = ["Nike","Puma","A.testoni","Reebok","Head","Addidas","Kappa","JDX","ELLE","Armani"]
    let recentSearchList : [String] = ["Head","Addidas","Kappa","JDX","ELLE","Armani"]
    
    var body: some View {
        VStack {
            if isSearching {
                SearchResultView()
            } else {
                PopularSearchView()
            }
        }
    }
    
    @ViewBuilder
    private func PopularSearchView() -> some View{
        CurrentSearchView()
        List {
            Section(header: Text("인기 검색어 Top10")){
                ForEach(popularSearchList.indices, id: \.self) { index in
                        Text(popularSearchList[index])
                }
            }
        }
    }
    
    @ViewBuilder
    private func CurrentSearchView() -> some View{
        VStack{
            HStack {
                Text("최근 검색어")
                    .font(.system(size: 17, weight: .medium))
                
                Spacer()
                
                Button(action: {
                    
                }, label: {
                    Text("기록 삭제")
                        .font(.system(size: 15, weight: .light))
                        .foregroundColor(.gray)
                })
            }
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(recentSearchList.indices, id: \.self) { data in
                        Button(action: {

                        }, label: {
                            Text(recentSearchList[data])
                                .padding(.horizontal, 15.0)
                                .padding(.vertical, 5.0)
                                    .font(.system(size: 15))
                                    .foregroundColor(.white)
                                    .background(.black)
                                    .cornerRadius(20)
                        })
                    }
                }
            }
        }
        .padding(.horizontal, 15.0)
    }
    
    @ViewBuilder
    private func SearchResultView() -> some View{
        List {
            ForEach(mockBrandList.filter{ $0.contains(searchText) }, id: \.self) { item in
                    Text(item)
            }
        }
    }
}


struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
