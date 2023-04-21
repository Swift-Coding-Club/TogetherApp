//
//  DotIndicator.swift
//  MarketApp
//
//  Created by 서원지 on 2023/02/03.
//

import SwiftUI

struct DotIndicator: View {
    let size: CGFloat
    let activeColor: Color
    let inactiveColor: Color
    let pageIndex: Int
    @Binding var selectedPage: Int
    let isActiveCapsule: Bool
    
    var body: some View {
        Button(action: {
            self.selectedPage = self.pageIndex
        }, label: {
            Capsule()
//                .animation(.linear)
                .foregroundColor(
                    selectedPage == pageIndex ? activeColor : inactiveColor
                )
                .frame(width: isActiveCapsule && selectedPage == pageIndex ? size + 15 : size, height: size)
        })
    }
}

struct DotIndicator_Previews: PreviewProvider {
    static var previews: some View {
        DotIndicator(size: 8, activeColor: .gray, inactiveColor: .gray, pageIndex: 3, selectedPage: .constant(3), isActiveCapsule: true)
    }
}
