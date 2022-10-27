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
    
    let datas = ["정보", "사이즈", "리뷰", "문의"]
    
    var body: some View {
        VStack {
            ScrollView(.vertical, showsIndicators: true) {
                Image("shoes")
                    .resizable()
                    .frame(width: 390, height: 350)
                    .padding(.top, 50)
                
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
                .padding(.top, 20)
                .padding(.bottom, 10)
                
                infoView()
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
                    self.buyThis = true
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
        }.ignoresSafeArea(edges: .top)
    }

    
    @ViewBuilder
    private func infoView() -> some View {
        LazyHStack {
            ForEach(0..<4) { _ in
                Button("asdasd"){
                    //view change
                }
                .frame(width: 90, height: 30)
                .font(.system(size: 18))
                .foregroundColor(.black) //touch = black, notouch = gray
            }
        }
    }
}

struct ProductView_Previews: PreviewProvider {
    static var previews: some View {
        ProductView()
    }
}
