//
//  FontColor.swift
//  MarketApp
//
//  Created by 서원지 on 2022/12/31.
//

import SwiftUI

struct FontColor {
    let fontColor = Color("FontColor")
    let secondaryTextColor = Color("SecondaryTextColor")
}

extension Color {
    static let fontColor = FontColor()
}
