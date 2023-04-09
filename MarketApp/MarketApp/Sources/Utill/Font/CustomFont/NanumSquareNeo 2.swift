//
//  NanumSquareNeo.swift
//  MarketApp
//
//  Created by 서원지 on 2022/12/21.
//

import UIKit
import SwiftUI

enum NanumSquareNeoFamily: String {
    case aLt, bRG, cBd, dEb, eHv
}


struct NanumSquareNeoFont: ViewModifier {
    var family: NanumSquareNeoFamily
    var size: CGFloat
    var color: Color
    
    func body(content: Content) -> some View {
        return content.font(.custom("NanumSquareNeoTTF-\(family)", fixedSize: size))
            .foregroundColor(color)
    }
}

extension View {
    func nanumSquareNeo(family: NanumSquareNeoFamily, size: CGFloat, color: Color) -> some View {
        return self.modifier(NanumSquareNeoFont(family: family, size: size, color: color))
    }
}

extension UIFont {
    static func nanumSquareNeo(family: NanumSquareNeoFamily, size: CGFloat, color: Color) -> UIFont?{
        let font = UIFont(name: "NanumSquareNeo-\(family)", size: size)
        return font
    }
}

extension Font {
    static func nanumSquareNeo(family: NanumSquareNeoFamily, size: CGFloat, color: Color) -> Font{
        let font = Font.custom("NanumSquareNeo-\(family)", size: size)
        return font
    }
}

