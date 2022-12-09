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
        SearchedView(searchText: text)
            .searchable(text: $text)
    }
}

struct SearchedView: View {
    @State private var removeSearch = false
    @State var recentSearchList : [String] = ["Head","Addidas","Kappa","JDX","ELLE","Armani"]
    @Environment(\.isSearching) private var isSearching
    
    let searchText: String
    let mockBrandList : [String] = ["Nike","Puma","A.testoni","Reebok","Head","Addidas","Kappa","JDX","ELLE","Armani", "Columbia","H&M","ZARA","LouisVitton","UNIQLO","Hermes","Gucci","UnderArmour"]
    let popularSearchList : [String] = ["Nike","Puma","A.testoni","Reebok","Head","Addidas","Kappa","JDX","ELLE","Armani"]
    
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
        .listStyle(.plain)
    }
    
    @ViewBuilder
    private func CurrentSearchView() -> some View{
        VStack {
            HStack {
                Text("최근 검색어")
                    .frame(width: 200, height: 30, alignment: .leading)
                    .font(.system(size: 17, weight: .semibold))
                Button(action: {
                    self.removeSearch.toggle()
                }, label: {
                    Text("기록 삭제")
                        .frame(width: 140, height: 30, alignment: .trailing)
                        .font(.system(size: 15, weight: .light))
                        .foregroundColor(.gray)
                })
                .alert(Text("기록 전체 삭제"), isPresented: $removeSearch, actions: {
                    Button("확인", role: .destructive) { recentSearchList.removeAll() }
                    Button("취소", role: .cancel) {}
                }, message: {
                    Text("정말 삭제하시겠어요?")
                })
            }
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(recentSearchList.indices, id: \.self) { data in
                        Button(action: {
                            
                        }, label: {
                                Text(recentSearchList[data])
                                    .frame(width: 100, height: 30, alignment: .center)
                                    .font(.system(size: 15))
                                    .foregroundColor(.white)
                                    .background(.black)
                                    .cornerRadius(20)
                        })
                    }
                }
            }
            .padding(.horizontal)
        }
    }
    
    @ViewBuilder
    private func SearchResultView() -> some View{
        List {
            ForEach(mockBrandList.filter{ $0.lowercased().contains(searchText.lowercased()) }, id: \.self) { item in
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
