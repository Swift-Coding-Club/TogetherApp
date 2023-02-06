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
                .nanumSquareNeo(family: .cBd, size: 18, color: .black)
            
            Spacer()
            
            
            Button {
                showView.toggle()
            } label: {
                Image(systemName: "chevron.right")
                    .resizable()
                    .frame(width: 10, height: 20)
                    .foregroundColor(.black)
            }
        }
        .padding(20)
        .overlay {
            RoundedRectangle(cornerRadius: 10)
                .fill(.clear)
                .frame(height: 50)
                .shadow(color: .black.opacity(0.8), radius: 10, x: 10, y: .zero)
        }
    }
}

struct ListArrowView_Previews: PreviewProvider {
    static var previews: some View {
        ListArrowView(listTitle: "약관", showView: .constant(false))
    }
}
