//
//  ListtLoginView.swift
//  MarketApp
//
//  Created by 서원지 on 2023/02/06.
//

import SwiftUI

struct ListtLoginView: View {
    let listTitle: String
    @Binding var showPOPUPView: Bool
    var color: Color
    
    
    var body: some View {
        HStack {
            Button {
                showPOPUPView = true
            } label: {
                Text(listTitle)
                    .nanumSquareNeo(family: .cBd, size: 20, color: color)
            }
            
            Spacer()
        }
        .padding(20)
        .overlay {
            RoundedRectangle(cornerRadius: 10)
                .fill(.clear)
                .frame(height: 50)
        }
    }
}

struct ListtLoginView_Previews: PreviewProvider {
    static var previews: some View {
        ListtLoginView(listTitle: "로그아웃", showPOPUPView: .constant(false), color: .black)
    }
}
