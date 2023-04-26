//
//  WebViews.swift
//  MarketApp
//
//  Created by 서원지 on 2023/03/04.
//

import SwiftUI

struct WebViews: View {
    var url: String
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @Binding var loading: Bool
    
    
    var body: some View {
        VStack {
            if loading {
                LottieLoadingView()
            } else {
                WebView(urlToLoad: url)
            }
        }
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                customBackButton()
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                loading = true
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) { // Replace 2 with desired delay
                    loading = false
                }
            }
        }
    }
    //MARK: - 뒤로 가기 버튼
    @ViewBuilder
    private func customBackButton() -> some View {
        Button {
            self.presentationMode.wrappedValue.dismiss()
        } label: {
            Image(systemName: "chevron.left")
                .frame(width: 30, height: 30)
                .foregroundColor(.black)
        }

    }
}

struct WebViews_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            WebViews(url: "https://velog.io/@suhwj/%EA%B0%9C%EC%9D%B8%EC%A0%95%EB%B3%B4-%EC%B2%98%EB%A6%AC-%EB%B0%A9%EC%B9%A8", loading: .constant(false))
        }
    }
}
