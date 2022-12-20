//
//  Coupon.swift
//  MarketApp
//
//  Created by 홍태희 on 2022/12/05.
//

import SwiftUI

struct Coupon: View {
    let percent = "30%"
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: true) {
            ForEach(0..<5) { _ in
                CouponList()
                    .padding()
            }
        }
    }
    
    @ViewBuilder
    private func CouponList() -> some View {
        ZStack {
            Rectangle()
                .fill(.white)
                .frame(width: 350, height: 200)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.black, lineWidth: 1)
                )
            
            VStack {
                Text("\(percent)")
                    .font(.system(size: 40, weight: .bold))
                    .foregroundColor(.black)
                    .padding(.bottom, 10)
                Text("블프 특가 신발 30% 할인쿠폰")
                    .font(.system(size: 20, weight: .medium))
                    .foregroundColor(.black)
                    .padding(.bottom, 5)
                Text("100000원 이상 구매시 사용 가능 / 중복 불가능")
                    .font(.system(size: 15, weight: .light))
                    .foregroundColor(.gray)
                    .padding(.bottom, 5)
                Text("~ 2022.11.30 까지")
                    .font(.system(size: 15, weight: .light))
                    .foregroundColor(.gray)
            }
        }
    }
}

struct Coupon_Previews: PreviewProvider {
    static var previews: some View {
        Coupon()
    }
}
