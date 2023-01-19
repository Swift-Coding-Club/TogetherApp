//
//  SignUPView.swift
//  MarketApp
//
//  Created by 서원지 on 2023/01/09.
//

import SwiftUI

struct SignUPView: View {
    var body: some View {
        VStack {
            Spacer()
                .frame(height: modalTopTransparentSize)
            HStack{
                Text("회원가입")
                    .nanumSquareNeo(family: .eHv, size: 30, color: Color.fontColor.secondaryTextColor)
                
                Spacer()
            }
            .padding(.horizontal, LayoutMargin)
            
            Spacer(minLength: .zero)
        }
    }
}

struct SignUPView_Previews: PreviewProvider {
    static var previews: some View {
        SignUPView()
    }
}
