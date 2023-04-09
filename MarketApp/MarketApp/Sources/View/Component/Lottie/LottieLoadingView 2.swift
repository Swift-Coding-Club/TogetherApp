//
//  LottieLoadingView.swift
//  MarketApp
//
//  Created by 서원지 on 2023/04/02.
//

import SwiftUI

struct LottieLoadingView: View {
    var body: some View {
        VStack {
            LottieView(name: "Loading", loopMode: .loop)
                .frame(width: 150, height: 150)
        }
    }
}

struct LottieLoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LottieLoadingView()
    }
}
