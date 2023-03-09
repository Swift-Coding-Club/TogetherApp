//
//  ProductView.swift
//  MarketApp
//
//  Created by 홍태희 on 2022/10/25.
//

import SwiftUI

struct ProductView: View {

    @State private var likeThis = false
    @State private var buyThis = false
    
    var body: some View {
        ScrollView {
            VStack {
                DetailInfo()
                InfoView()
            }
        }
    }
    
    @ViewBuilder
    private func DetailInfo() -> some View {
        VStack {
            Image("shoes")
                .resizable()
                .frame(height: 350)
            
            HStack {
                VStack {
                    Text("Maison Kitsune")
                        .font(.system(size: 15, weight: .bold, design: .monospaced))
                        .frame(width: 280, height: 20, alignment: .leading)
                    Text("더블 폭스 패치 스니커즈")
                        .font(.system(size: 18, weight: .medium, design: .default))
                        .frame(width: 280, height: 20, alignment: .leading)
                    Text("281,000원")
                        .font(.system(size: 15, weight: .bold, design: .monospaced))
                        .frame(width: 280, height: 20, alignment: .leading)
                }
                
                VStack(alignment: .center) {
                    Button(action: {
                        //좋아요 액션 ( 클릭시 heart.fill )
                    }) {
                        Image(systemName: "heart")
                            .resizable()
                            .renderingMode(.original)
                            .frame(width: 30, height: 30)
                    }
                    
                    Text("LIKE")
                        .font(.system(size: 18, weight: .medium, design: .default))
                }.frame(width: 50)
            }
            .padding(.top, 10)
            .padding(.bottom, 10)
        }
    }
}

struct ProductView_Previews: PreviewProvider {
    static var previews: some View {
        ProductView()
    }
}
