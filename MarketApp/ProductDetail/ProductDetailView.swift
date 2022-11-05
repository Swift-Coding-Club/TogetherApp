//
//  ProductDetailView.swift
//  MarketApp
//
//  Created by Keum MinSeok on 2022/11/04.
//

import SwiftUI

struct ProductDetailView: View {
    @State private var like = false
    @State private var buy = false
        
        var body: some View {
            VStack {
                ScrollView(.vertical, showsIndicators: true) {
                    Image("Nike")
                        .resizable()
                        .frame(maxWidth: .infinity, maxHeight: 380)
                    
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
                    
                    ProductInformationView()
                }
                
                HStack {
                    Button(action: {
                    }) {
                        Image(systemName: "heart")
                            .resizable()
                            .renderingMode(.original)
                            .frame(width: 30, height: 30)
                            .padding(.trailing, 10)
                    }
                    
                    Button(action: {
                        buy.toggle()
                    }) {
                        Text("구매")
                            .font(.system(size: 22, weight: .medium, design: .default))
                            .frame(width: 280, height: 50)
                            .padding(.leading, 10)
                            .background(.black)
                            .foregroundColor(.white)
                    }
                }
                .padding(.bottom, 1)
            }
        }
    }

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailView()
    }
}
