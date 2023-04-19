//
//  SearchBar.swift
//  MarketApp
//
//  Created by 서원지 on 2023/02/01.
//

import SwiftUI

struct SearchBar: View {
    @Binding var searchBarText: String
    var placeholder: String
    
    var body: some View {
        HStack {
            Spacer()
                .frame(width: 5)
            
            Image(systemName: "magnifyingglass")
                .resizable()
                .frame(width: 20, height: 20)
                .foregroundColor(
                    searchBarText.isEmpty ?
                    Color.colorAsset.gray.opacity(0.8) :
                    Color.fontColor.secondaryTextColor)
            
            Spacer()
                .frame(width: 10)
            
            TextField(placeholder, text: $searchBarText)
                .foregroundColor(Color.fontColor.secondaryTextColor)
                .disableAutocorrection(true)
            
            Image(systemName: "xmark.circle.fill")
                .padding()
                .offset(x: 10)
                .foregroundColor(Color.fontColor.secondaryTextColor)
                .opacity(searchBarText.isEmpty ? .zero : 1.0)
                .onTapGesture {
                    UIApplication.shared.endEditing()
                    searchBarText = ""
                }
            
        }
        .nanumSquareNeo(family: .bRG, size: 16, color: Color.fontColor.secondaryTextColor)
        .padding()
        .background(
        RoundedRectangle(cornerRadius: 15)
            .fill(Color.white)
            .shadow(color: Color.colorAsset.gray.opacity(0.6), radius: 10)
            .frame(height: 45)
        )
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(searchBarText: .constant(""), placeholder: "신발을 검색해주세요")
    }
}
