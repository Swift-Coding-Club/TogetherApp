//
//  LanuchView.swift
//  MarketApp
//
//  Created by 서원지 on 2022/12/21.
//

import SwiftUI

struct LanuchView: View {
    var body: some View {
        VStack {
            Spacer()
                .frame(height: 100)
            
           Text("Market APP 로고 미정 ")
                .nanumSquareNeo(family: .eHv, size: 30, color: .gray)
            Spacer(minLength: .zero)
        }
    }
}

struct LanuchView_Previews: PreviewProvider {
    static var previews: some View {
        LanuchView()
    }
}
