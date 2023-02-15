//
//  CartView.swift
//  MarketApp
//
//  Created by 홍태희 on 2022/10/25.
//

import SwiftUI

struct CartView: View {
    
    @State private var deleted = false
    
    var body: some View {
        VStack {
            ScrollView(.vertical, showsIndicators: true) {
                ForEach(0..<5) { _ in
                    CartList()
                        .padding()
                }
            }
            PriceStack()
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height/4, alignment: .center)
                .padding()
        }
    }
    
    @ViewBuilder
    private func CartList() -> some View {
        ZStack {
            Rectangle()
                .fill(.white)
                .frame(width: UIScreen.main.bounds.width - 30, height: UIScreen.main.bounds.height/2.5)
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
                        
                    }, label: {
                        Text("옵션변경")
                            .font(.system(size: 17, weight: .medium))
                            .frame(width: 150, height: 50)
                            .foregroundColor(.black)
                            .overlay(
                                RoundedRectangle(cornerRadius: 0)
                                    .stroke(.black, lineWidth: 1)
                            )
                    })
                    
                    Button(action: {
                        self.deleted.toggle()
                    }, label: {
                        Text("삭제")
                            .font(.system(size: 17, weight: .medium))
                            .frame(width: 150, height: 50)
                            .foregroundColor(.white)
                            .background(.black)
                    })
                    .alert(Text("삭제"), isPresented: $deleted, actions: {
                        Button("확인", role: .destructive) {}
                        Button("취소", role: .cancel) {}
                    }, message: {
                        Text("정말 삭제하시겠어요?")
                    })
                }
            }
        }
    }
    
    @ViewBuilder
    private func PriceStack() -> some View {
        let testValue = 230000
        let saleValue = 100000
        
        VStack {
            Text("기존 금액 :                                 \(testValue)원")
                .foregroundColor(.gray)
                .frame(width: UIScreen.main.bounds.width, height: 30, alignment: .center)
            Text("할인 금액 :                                 \(saleValue)원")
                .foregroundColor(.gray)
                .frame(width: UIScreen.main.bounds.width, height: 30, alignment: .center)
            Text("최종 결제 금액 :                          \(testValue - saleValue)원")
                .font(.system(size: 18, weight: .bold))
                .frame(width: UIScreen.main.bounds.width, height: 30, alignment: .center)
            
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
