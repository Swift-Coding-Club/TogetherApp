//
//  SearchView.swift
//  MarketApp
//
//  Created by 홍태희 on 2022/10/25.
//

import SwiftUI

struct SearchView: View {
    
    @State var searches = ""
    
    let demoData : [String] = ["Nik", "Adias", "Nerdy", "Proworld", "Pum", "North", "Aki", "Reebo", "Masione", "Gu"]
    
    var body: some View {
        VStack {
            if searches.count > 0 {
                List {
                    ForEach(demoData.filter{ $0.contains(searches) }, id: \.self) { item in
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
                    
                }, label: {
                    Text("기록 삭제")
                        .frame(width: 140, height: 30, alignment: .trailing)
                        .font(.system(size: 15, weight: .light))
                        .foregroundColor(.gray)
                })
            }
            .padding()
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(demoData.indices) { data in
                        Button(action: {
                            
                        }, label: {
                                Text(demoData[data])
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
                ForEach(demoData.indices, id: \.self) { index in
                    Text(demoData[index]) //TODO : ADD NavigationLink
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
