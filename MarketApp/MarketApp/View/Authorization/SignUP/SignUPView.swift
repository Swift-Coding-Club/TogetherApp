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
            Text("회원가입")
                .nanumSquareNeo(family: .eHv, size: 30, color: Color.fontColor.secondaryTextColor)
        }
    }
}

struct SignUPView_Previews: PreviewProvider {
    static var previews: some View {
        SignUPView()
    }
}
