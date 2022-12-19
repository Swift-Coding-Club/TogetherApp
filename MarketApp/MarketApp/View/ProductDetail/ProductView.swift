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
        VStack {
            ScrollView(.vertical, showsIndicators: true) {
                Image("shoes")
                    .resizable()
                    .frame(maxWidth: .infinity, minHeight: 350)
                
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
                            .frame(width: 30, height: 30, alignment: .center)
                            .foregroundColor(.yellow)
                        Text("4.5")
                            .font(.system(size: 18, weight: .medium, design: .default))
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.top, 10)
                .padding(.bottom, 10)
                
                InfoView()
            }
            
            HStack {
                Button(action: {
                    //좋아요 액션 ( 클릭시 heart.fill )
                }) {
                    Image(systemName: "heart")
                        .resizable()
                        .renderingMode(.original)
                        .frame(width: 30, height: 30)
                        .padding(.trailing, 10)
                }
                
                Button(action: {
                    buyThis.toggle()
                }) {
                    Text("구매")
                        .font(.system(size: 22, weight: .medium, design: .default))
                        .frame(width: 280, height: 50)
                        .padding(.leading, 10)
                        .background(.black)
                        .foregroundColor(.white)
                        .sheet(isPresented: self.$buyThis) {
                            PopView()
                        }
                }
            }.padding(.bottom, 20)
        }
    }
}

struct ProductView_Previews: PreviewProvider {
    static var previews: some View {
        ProductView()
    }
}
