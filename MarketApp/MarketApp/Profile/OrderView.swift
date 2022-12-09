//
//  OrderView.swift
//  MarketApp
//
//  Created by Keum MinSeok on 2022/12/10.
//

import SwiftUI

struct OrderView: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            ForEach(0..<2) { _ in
                CartList()
                    .padding(.vertical)
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
            
            Button(action: {
                
            }, label: {
                Image(systemName: "xmark.circle.fill")
                    .resizable()
                    .foregroundColor(.black)
                    .frame(width: 20, height: 20)
            })
            .padding(.leading, 300)
            .padding(.bottom, 200)
            
            VStack {
                HStack {
                    Image("shoes")
                        .resizable()
                        .frame(width: 120, height: 120)
                        .padding(.trailing, 10)
                    
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
                .padding(.bottom, 15)
                
                HStack {
                    Button(action: {
                        
                    }, label: {
                        Text("배송조회")
                            .foregroundColor(.black)
                            .font(.system(size: 17))
                            .frame(width: 150, height: 50)
                            .overlay(
                                RoundedRectangle(cornerRadius: 0)
                                    .stroke(.black, lineWidth: 1)
                            )
                    })
                    
                    Button(action: {
                        
                    }, label: {
                        Text("리뷰작성")
                            .foregroundColor(.white)
                            .font(.system(size: 17))
                            .frame(width: 150, height: 50)
                            .background(.black)
                    })
                }
            }
        }
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView()
    }
}
