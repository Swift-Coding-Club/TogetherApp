//
//  ProductView.swift
//  MarketApp
//
//  Created by 홍태희 on 2022/10/25.
//

import SwiftUI

struct ProductView: View {
    var body: some View {

        VStack {
            //물건 이미지

            //물건정보
            Group {
                HStack {
                    VStack {
                        Text("Maison Kitsune")
                            .font(.system(size: 15, weight: .bold, design: .monospaced))
                            .frame(width: 300, height: 20, alignment: .leading)
                        Text("더블 폭스 패치 스니커즈")
                            .font(.system(size: 18, weight: .medium, design: .default))
                            .frame(width: 300, height: 20, alignment: .leading)
                        Text("281,000원")
                            .font(.system(size: 15, weight: .bold, design: .monospaced))
                            .frame(width: 300, height: 20, alignment: .leading)
                    }
                    
                    VStack {
                        Image(systemName: "star.fill").resizable()
                            .frame(width: 40, height: 40, alignment: .center)
                            .foregroundColor(.yellow)
                        Text("4.5")
                            .font(.system(size: 18, weight: .medium, design: .default))
                    }
                }
            }.padding(.top, 380)
            
            //정보/사이즈/후기/문의 (상단탭바)
            
            //구매 버튼 & 구매 팝업
            Button("구매"){
                
            }
            .font(.system(size: 22, weight: .medium, design: .default))
            .frame(width: 280, height: 50, alignment: .center)
            .cornerRadius(12)
            .background(.black)
            .foregroundColor(.white)
            .padding(.bottom, 10)
        }
    }
}

struct ProductView_Previews: PreviewProvider {
    static var previews: some View {
        ProductView()
    }
}
