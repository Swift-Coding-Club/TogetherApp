//
//  PagerIndicator.swift
//  MarketApp
//
//  Created by 서원지 on 2023/02/03.
//

import SwiftUI

struct PagerIndicator: View {
    @Binding var selectedPage: Int
    var size: CGFloat
    let activeColor: Color
    let inactiveColor: Color
    var pageCount: Int
    var isActiveCapsule = false
    
    var body: some View {
        HStack {
            ForEach(0..<pageCount, id: \.self) {
                DotIndicator(size: size
                             , activeColor: activeColor
                             , inactiveColor: inactiveColor
                             , pageIndex: $0
                             , selectedPage: self.$selectedPage
                             , isActiveCapsule: isActiveCapsule)
            }
        }
    }
}

struct PagerIndicator_Previews: PreviewProvider {
    static var previews: some View {
        PagerIndicator(selectedPage: .constant(2)
                       , size: 8
                       , activeColor: Color(red: 255, green: 255, blue: 255)
                       , inactiveColor: Color(red: 232/255, green: 232/255, blue: 232/255, opacity: 0.3)
                       , pageCount: 5)
    }
}
