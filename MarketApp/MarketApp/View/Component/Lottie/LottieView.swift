//
//  LottieView.swift
//  MarketApp
//
//  Created by 서원지 on 2023/04/02.
//

import SwiftUI
import Lottie
import Kingfisher

struct LottieView: UIViewRepresentable {
    let name: String
    let loopMode: LottieLoopMode
    let animationSpeed: CGFloat
    let contentMode: UIView.ContentMode
    
    
    
    init(name: String, loopMode: LottieLoopMode, animationSpeed: CGFloat = 1, contentMode: UIView.ContentMode = .scaleAspectFit) {
        self.name = name
        self.loopMode = loopMode
        self.animationSpeed = animationSpeed
        self.contentMode = contentMode
    }
    
    
    func makeUIView(context: Context) -> LottieAnimationView {
        let animationView = LottieAnimationView(name: name)
        animationView.contentMode = contentMode
        animationView.loopMode = loopMode
        animationView.animationSpeed = animationSpeed
        animationView.play()
        return animationView
    }
    
    func updateUIView(_ uiView: LottieAnimationView, context: Context) {
        
    }
}


struct LottieView_Previews:PreviewProvider {
    static var previews: some View {
        LottieView(name: "Loading", loopMode: .loop, animationSpeed: 1)
    }
}
