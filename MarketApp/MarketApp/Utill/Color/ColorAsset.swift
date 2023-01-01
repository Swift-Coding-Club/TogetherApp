//
//  ColorAsset.swift
//  MarketApp
//
//  Created by 서원지 on 2022/12/31.
//

import Foundation
import SwiftUI

struct ColorAsset {
    let backGroudColor = Color("BackgroundColor")
    let mauve = Color("mauve")
    let mainColor = Color("MainColor")
    let mauve2 = Color("mauve2")
}

extension Color {
    static let colorAsset = ColorAsset()
}
