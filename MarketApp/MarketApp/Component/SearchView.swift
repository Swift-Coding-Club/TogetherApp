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
        SearchList()
             .searchable(text: $searches)
    }
    
    @ViewBuilder
    private func SearchList() -> some View {
        if searches.count > 0 {
            List {
                ForEach(demoData.filter{ $0.contains(searches) }, id: \.self) { item in
                    Text(item) //TODO : ADD NavigationLink
                }
            }
            .listStyle(PlainListStyle())
        } else {
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
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
