//
//  EditImageModifier.swift
//  MarketApp
//
//  Created by 서원지 on 2023/02/06.
//

import SwiftUI

struct EditImageModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 30))
            .background(.white)
            .cornerRadius(10, corners: .allCorners)
            .offset(x: 40, y: 40)
    }
}

extension Image {
    func editImageView() -> some View {
        self.modifier(EditImageModifier())
    }
}
