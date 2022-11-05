//
//  ProductView.swift
//  MarketApp
//
//  Created by 홍태희 on 2022/10/25.
//

import SwiftUI


struct ProductView: View {
//    @Binding var currentTab: Int
       var tabBarOptions: [String] = ["정보", "사이즈", "후기", "문의"]
    var body: some View {
        LazyVStack(spacing: 60) {
            LazyVStack {
                Image(systemName: "gift").resizable().frame(width: 393,height: 300, alignment: .center).background(.gray)
                Text("Maison Kitsune")
                    .font(.system(size: 13, weight: .bold))
                    .frame(width: 393, height: 20, alignment: .leading)
                    .foregroundColor(.black)
                Text("더블 폭스 패치 스니커즈")
                    .font(.system(size: 25, weight: .bold))
                    .frame(width: 393, height: 20, alignment: .leading)
                    .foregroundColor(.black)
                Text("281,000원")
                    .font(.system(size: 20, weight: .bold))
                    .frame(width: 393, height: 20, alignment: .leading)
                    .foregroundColor(.black)
            }
            
            
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) {
                    ForEach(tabBarOptions.indices, id: \.self) { index in
                        let title = tabBarOptions[index]
                        Text(title).frame(alignment:.center)

                    }
                }
                .padding(.horizontal)
            }
            
            Spacer()
            
            HStack(spacing: 30){
                
                Button {
                    
                } label: {
                    Image(systemName: "heart.fill")
                        .font(.system(size: 15, weight: .bold))
                        .frame(width: 60, height: 45)
                        .background(Color.gray)
                        .foregroundColor(.white)
                        .cornerRadius(14)
                }
                
                Button {
                    
                } label: {
                    Text("구매하기")
                        .font(.system(size: 15, weight: .bold))
                        .frame(width: 250, height: 45, alignment: .center)
                        .background(Color.black)
                        .foregroundColor(.white)
                        .cornerRadius(14)
                }
            }
            
        }.padding(10)
        
    }
}

struct ProductView_Previews: PreviewProvider {
    static var previews: some View {
        ProductView()
    }
}
