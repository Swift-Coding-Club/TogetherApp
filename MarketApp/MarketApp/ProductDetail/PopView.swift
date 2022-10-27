//
//  PopView.swift
//  MarketApp
//
//  Created by 홍태희 on 2022/10/26.
//

import SwiftUI

struct PopView: View {
    
    @Environment(\.presentationMode) var present //Modal
    @State private var count = 0 //총 금액
    
    var body: some View {
        HStack {
            HStack {
                Button(action: {
                    
                }, label: {
                    Text("-")
                })
                .foregroundColor(.gray)
                .frame(width: 30, height: 30, alignment: .center)
                Text("1") //개수
                    .frame(width: 50, height: 30, alignment: .center)
                Button(action: {
                    
                }, label: {
                    Text("+")
                })
                .foregroundColor(.gray)
                .frame(width: 30, height: 30, alignment: .center)
            }.padding(.trailing, 50)
            
            HStack {
                Text("총 금액")
                    .font(.system(size: 15, weight: .medium))
                    .foregroundColor(.gray)
                Text("20000원")
                    .font(.system(size: 17, weight: .medium))
                    .frame(width: 100, height: 25, alignment: .leading)
                    .foregroundColor(.black)
            }
        }
        .background(.white)
        .transition(.move(edge: .bottom))
        .ignoresSafeArea()
    }
}

struct PopView_Previews: PreviewProvider {
    static var previews: some View {
        PopView()
    }
}
