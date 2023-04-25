//
//  ListArrowView.swift
//  MarketApp
//
//  Created by 서원지 on 2023/02/06.
//

import SwiftUI

struct ListArrowView: View {
    let listTitle: String
    @Binding var showView: Bool
    
    var body: some View {
        HStack {
            Text(listTitle)
                .nanumSquareNeo(family: .cBd, size: 18, color: Color.colorAsset.lightBlack)
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .resizable()
                .frame(width: 10, height: 20)
                .foregroundColor(Color.colorAsset.lightBlack)
        }
        .padding(20)
        .overlay {
            RoundedRectangle(cornerRadius: 10)
                .fill(.clear)
                .frame(height: 50)
                .shadow(color: Color.colorAsset.lightBlack, radius: 10, x: 10, y: .zero)
                .onTapGesture {
                    showView.toggle()
                }
        }
       
    }
}

struct ListArrowView_Previews: PreviewProvider {
    static var previews: some View {
        ListArrowView(listTitle: "약관", showView: .constant(false))
    }
}
