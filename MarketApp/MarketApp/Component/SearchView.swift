//
//  SearchView.swift
//  MarketApp
//
//  Created by 홍태희 on 2022/10/25.
//

import SwiftUI

struct SearchView: View {
    
    @State private var searches = ""
    @State private var removeSearch = false
    
    @State var nowData = ["Nerdy", "Proworld", "Pum", "Aki", "Reebo", "Masione", "Gu"]
    var topData = ["Nik", "Adias", "Nerdy", "Proworld", "Pum", "North", "Aki", "Reebo", "Masione", "Gu"]
    
    var body: some View {
        VStack {
            if searches.count > 0 {
                List {
                    ForEach(topData.filter{ $0.contains(searches) }, id: \.self) { item in
                        Text(item) //TODO : ADD NavigationLink
                    }
                }
                .listStyle(PlainListStyle())
            } else {
                VStack {
                    SearchTimeLine()
                        .padding()
                    SearchList()
                }
            }
        }.searchable(text: $searches)
    }
    
    @ViewBuilder
    private func SearchTimeLine() -> some View {
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
                    Button("🙆", role: .destructive) { nowData.removeAll() }
                    Button("🙅", role: .cancel) {}
                }, message: {
                    Text("정말 삭제하시겠어요?")
                })
            }
            .padding()
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(nowData.indices, id: \.self) { data in
                        Button(action: {
                            
                        }, label: {
                                Text(nowData[data])
                                    .frame(width: 100, height: 30, alignment: .center)
                                    .font(.system(size: 15))
                                    .foregroundColor(.white)
                                    .background(.black)
                                    .cornerRadius(20)
                        })
                    }
                }
            }
        }
    }
    
    @ViewBuilder
    private func SearchList() -> some View {
        List {
            Section(header: Text("인기검색어 Top10")) {
                ForEach(topData.indices, id: \.self) { index in
                    Text(topData[index]) //TODO : ADD NavigationLink
                }
            }
        }
        .listStyle(PlainListStyle())
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
