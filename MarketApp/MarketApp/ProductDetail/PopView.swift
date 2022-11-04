//
//  PopView.swift
//  MarketApp
//
//  Created by 홍태희 on 2022/10/26.
//

import SwiftUI

struct PopView: View {
    
    //@Environment(\.dismiss) var dismiss //Modal
    
    @State private var clickEvent = 1
    @State private var shoeSize = "사이즈 선택하기"
    let size = ["230", "240", "250", "260", "270", "280"]
    
    var body: some View {
        VStack {
            Text("더블 폭스 패치 스니커즈")
                .foregroundColor(.black)
                .font(.system(size: 15, weight: .medium))
                .frame(maxWidth: .infinity, minHeight: 10, alignment: .leading)
                .padding()
            
            //사용자가 사이즈를 맞게 선택했는지 알 수 있는 방법? => 얼럿 or 텍스트(선택바 or 별도)
            Picker("사이즈 선택", selection: $shoeSize) {
                ForEach(size, id: \.self) { item in
                    Text(item)
                }
            }
            .pickerStyle(.menu)
            .foregroundColor(.black)
            .frame(maxWidth: 350, minHeight: 50, alignment: .center)
            .overlay(
                RoundedRectangle(cornerRadius: 0)
                    .stroke(.gray, lineWidth: 1)
            )
            
            HStack {
                HStack {
                    Button(action: {
                        
                    }, label: {
                        Text("-")
                    })
                    .foregroundColor(.gray)
                    .frame(width: 30, height: 20, alignment: .center)
                    .overlay(
                        RoundedRectangle(cornerRadius: 0)
                            .stroke(.gray, lineWidth: 1)
                    )
                    Text("1") //개수
                        .foregroundColor(.black)
                        .frame(width: 50, height: 30, alignment: .center)
                        .overlay(
                            RoundedRectangle(cornerRadius: 0)
                                .stroke(.black, lineWidth: 1)
                        )
                        .padding()
                    Button(action: {
                        
                    }, label: {
                        Text("+")
                    })
                    .foregroundColor(.gray)
                    .frame(width: 30, height: 20, alignment: .center)
                    .overlay(
                        RoundedRectangle(cornerRadius: 0)
                            .stroke(.gray, lineWidth: 1)
                    )
                }.padding(.trailing, 20)
                
                HStack {
                    Text("총 금액")
                        .font(.system(size: 15, weight: .medium))
                        .foregroundColor(.gray)
                    Text("20000원")
                        .font(.system(size: 17, weight: .medium))
                        .frame(width: 100, height: 25, alignment: .trailing)
                        .foregroundColor(.black)
                }
            }.padding()
            
            HStack {
                Button(action: {
                    
                }, label: {
                    Text("장바구니")
                        .font(.system(size: 17, weight: .medium))
                        .frame(width: 180, height: 50)
                        .foregroundColor(.black)
                        .overlay(
                            RoundedRectangle(cornerRadius: 0)
                                .stroke(.black, lineWidth: 2)
                        )
                })
                
                Button(action: {
                    
                }, label: {
                    Text("구매하기")
                        .font(.system(size: 17, weight: .medium))
                        .frame(width: 180, height: 50)
                        .foregroundColor(.white)
                        .background(.black)
                })
            }
        }
        .transition(.move(edge: .bottom))
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct PopView_Previews: PreviewProvider {
    static var previews: some View {
        PopView()
    }
}
