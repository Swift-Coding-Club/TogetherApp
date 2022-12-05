//
//  Order.swift
//  MarketApp
//
//  Created by 홍태희 on 2022/12/05.
//

import SwiftUI

struct Order: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: true) {
            ForEach(0..<2) { _ in
                CartList()
                    .padding()
            }
        }
    }
    
    @ViewBuilder
    private func CartList() -> some View {
        ZStack {
            Rectangle()
                .fill(.white)
                .frame(width: 350, height: 250)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.black, lineWidth: 1)
                )
            
            VStack {
                HStack {
                    Image("shoes")
                        .resizable()
                        .frame(width: 120, height: 120)
                        .padding(.trailing, 10)
                    
                    VStack {
                        VStack {
                            Text("Maison Kitsune")
                                .font(.system(size: 15, weight: .bold, design: .monospaced))
                                .frame(width: 180, height: 20, alignment: .leading)
                            Text("더블 폭스 패치 스니커즈")
                                .font(.system(size: 18, weight: .medium, design: .default))
                                .frame(width: 180, height: 20, alignment: .leading)
                            Text("배송중")
                                .font(.system(size: 15, weight: .medium, design: .default))
                                .frame(width: 180, height: 20, alignment: .leading)
                                .foregroundColor(.red)
                            Text("281,000원")
                                .font(.system(size: 15, weight: .bold, design: .monospaced))
                                .frame(width: 180, height: 20, alignment: .leading)
                        }
                    }
                }.padding(.bottom, 20)
                
                HStack {
                    Button(action: {
                        
                    }, label: {
                        Text("배송조회")
                            .font(.system(size: 17, weight: .medium))
                            .frame(width: 150, height: 50)
                            .foregroundColor(.black)
                            .overlay(
                                RoundedRectangle(cornerRadius: 0)
                                    .stroke(.black, lineWidth: 1)
                            )
                    })
                    
                    Button(action: {
                        
                    }, label: {
                        Text("리뷰작성")
                            .font(.system(size: 17, weight: .medium))
                            .frame(width: 150, height: 50)
                            .foregroundColor(.white)
                            .background(.black)
                    })
                }
            }
        }
    }
}

struct Order_Previews: PreviewProvider {
    static var previews: some View {
        Order()
    }
}
