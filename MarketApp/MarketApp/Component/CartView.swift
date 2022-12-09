//
//  CartView.swift
//  MarketApp
//
//  Created by 홍태희 on 2022/10/25.
//

import SwiftUI

struct CartView: View {
    @State private var changeOption = false
    var body: some View {
        VStack {
            ScrollView(.vertical, showsIndicators: true) {
                ForEach(0..<3) { _ in
                    CartList()
                        .padding(.vertical)
                }
                PriceStack()
            }
        }
    }
    
    @ViewBuilder
    private func CartList() -> some View {
        ZStack {
            Rectangle()
                .fill(.white)
                .frame(width: 350, height: 320)
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
                            
                            Text("281,000원")
                                .font(.system(size: 15, weight: .bold, design: .monospaced))
                                .frame(width: 180, height: 20, alignment: .leading)
                        }
                    }
                }
                
                Rectangle()
                    .fill(.white)
                    .frame(width: 300, height: 50, alignment: .center)
                    .overlay(
                        Rectangle()
                            .stroke(Color.gray, lineWidth: 1)
                    )
                    .padding()
                
                HStack {
                    Button(action: {
                        changeOption.toggle()
                    }, label: {
                        Text("옵션변경")
                            .font(.system(size: 17, weight: .medium))
                            .frame(width: 150, height: 50)
                            .foregroundColor(.black)
                            .overlay(
                                RoundedRectangle(cornerRadius: 0)
                                    .stroke(.black, lineWidth: 1)
                            )
                            .sheet(isPresented: self.$changeOption) {
                                PopView()
                            }
                    })
                    
                    Button(action: {
                        
                    }, label: {
                        Text("삭제")
                            .font(.system(size: 17, weight: .medium))
                            .frame(width: 150, height: 50)
                            .foregroundColor(.white)
                            .background(.black)
                    })
                }
            }
        }
    }
    
    @ViewBuilder
    private func PriceStack() -> some View {
        let testValue = 230000
        let saleValue = 30000
        
        VStack {
            Text("기존 금액 :                                 \(testValue)원")
                .foregroundColor(.gray)
                .frame(width: 300, height: 30, alignment: .leading)
            
            Text("할인 금액 :                                 \(saleValue)원")
                .foregroundColor(.gray)
                .frame(width: 300, height: 30, alignment: .leading)
            
            Text("최종 결제 금액 :                          \(testValue - saleValue)원")
                .foregroundColor(.black)
                .frame(width: 300, height: 30, alignment: .leading)
            
            Button(action: {
                
            }, label: {
                Text("구매하기")
                    .font(.system(size: 17, weight: .medium))
                    .frame(width: 350, height: 50)
                    .foregroundColor(.white)
                    .background(.black)
            })
        }
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
    }
}
