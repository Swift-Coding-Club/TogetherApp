//
//  ProductView.swift
//  MarketApp
//
//  Created by 홍태희 on 2022/10/25.
//

import SwiftUI

struct ProductView: View {
    var body: some View {
        VStack{
            ScrollView(.vertical, showsIndicators: true){
                AsyncImage(url: URL(string: "https://image.msscdn.net/images/prd_img/20201112/1688130/detail_1688130_1_500.jpg?t=20210907153039"), content: { image in
                    image.resizable()
                }, placeholder: {
                    ProgressView()
                })
                .frame(maxWidth: .infinity, minHeight: 300)
                
                HStack{
                    VStack{
                        Text("Maison Kitsune")
                            .font(.system(size: 17, weight: .bold, design: .serif))
                            .foregroundColor(.black)
                            .frame(width: 250, height: 20, alignment: .leading)
                        Text("더블 폭스 패치 스니커즈")
                            .font(.system(size: 24, weight: .bold, design: .serif))
                            .foregroundColor(.black)
                            .frame(width: 250, height: 20, alignment: .leading)
                        Text("281,000원")
                            .font(.system(size: 24, weight: .bold, design: .serif))
                            .foregroundColor(.black)
                            .frame(width: 250, height: 20, alignment: .leading)
                    }
                    .padding(20)
                    Spacer()
                    VStack{
                        Text("4.5")
                            .font(.system(size: 22, weight: .medium, design: .serif))
                            .foregroundColor(.black)
                    }
                    .padding(20)
                }
                HStack{
                    Button(action: {
                        
                    }){
                        Text("좋아요")
                            .font(.system(size: 24, weight: .bold, design: .serif))
                            .foregroundColor(.black)
                    }
                    
                    Button(action: {
                        
                    }){
                        Text("구매하기")
                            .font(.system(size: 24, weight: .bold, design: .serif))
                            .foregroundColor(.black)
                            .background(Color(red:56, green:56, blue:58))
                    }
                }.padding(.bottom, 20)
            }
        }
    }
}

struct ProductView_Previews: PreviewProvider {
    static var previews: some View {
        ProductView()
    }
}
