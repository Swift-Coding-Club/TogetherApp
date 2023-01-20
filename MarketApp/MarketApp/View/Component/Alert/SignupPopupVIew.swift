//
//  SignupPopupVIew.swift
//  MarketApp
//
//  Created by 서원지 on 2023/01/20.
//

import SwiftUI

struct SignupPopupVIew: View {
    let image: String
    let title: String
    let alertMessage: String
    
    var body: some View {
        HStack(alignment: .center , spacing: 10) {
            Image(systemName: image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 30, height: 30)
                .nanumSquareNeo(family: .cBd, size: 18, color: .white)
            VStack(alignment: .leading, spacing: 2) {
                Text(title)
                    .nanumSquareNeo(family: .cBd, size: 18, color: .white)
                    .multilineTextAlignment(.leading)
                    .lineLimit(1)
                Text(alertMessage)
                    .nanumSquareNeo(family: .cBd, size: 15, color: .white)
                    .lineLimit(1)
                Divider().opacity(.zero)
            }
        }
        .padding()
        .frame(width: UIScreen.screenWidth - 70, height: UIScreen.screenHeight  / 8 )
        .background(Color.colorAsset.mainColor)
        .cornerRadius(20)
    }
}

struct SignupPopupVIew_Previews: PreviewProvider {
    static var previews: some View {
        SignupPopupVIew(image: "flame", title: "알링", alertMessage: "로그아웃")
    }
}

