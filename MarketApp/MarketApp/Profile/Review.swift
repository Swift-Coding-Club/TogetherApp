//
//  Review.swift
//  MarketApp
//
//  Created by 홍태희 on 2022/12/05.
//

import SwiftUI

struct Review: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: true) {
            ForEach(0..<2) { _ in
                MyReview()
                    .padding()
            }
        }
    }
    
    @ViewBuilder
    private func MyReview() -> some View {
        VStack {
            HStack {
                Image("shoes")
                    .resizable()
                    .frame(width: 80, height: 80)
                    .cornerRadius(120)
                    .padding(.trailing, 10)
                
                Text("Violet Purple")
                    .padding(.trailing, 30)
                
                ForEach(0..<5) { _ in
                    Image(systemName: "star.fill")
                        .resizable()
                        .frame(width: 18, height: 18, alignment: .center)
                        .foregroundColor(.yellow)
                }
            }
            
            Text("Maison Kitsune 더블 폭스 패치 스니커즈 / 240")
                .frame(width: 350, height: 20, alignment: .leading)
                .foregroundColor(.gray)
                .font(.system(size: 15))
                .padding(.bottom, 5)
            
            Image("blue")
                .resizable()
                .frame(width: 350, height: 250)
                .padding(.bottom, 5)
            
            Text("여기는 리뷰가 달리는 곳. 코멘트는 50자이내?")
                .frame(width: 350, height: 20, alignment: .leading)
                .foregroundColor(.black)
                .font(.system(size: 15))
        }
    }
}

struct Review_Previews: PreviewProvider {
    static var previews: some View {
        Review()
    }
}
