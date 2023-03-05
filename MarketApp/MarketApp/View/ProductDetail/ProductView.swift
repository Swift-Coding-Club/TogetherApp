//
//  ProductView.swift
//  MarketApp
//
//  Created by 홍태희 on 2022/10/25.
//

import SwiftUI
import UIKit

struct ProductView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @State private var likeThis = false
    @State private var buyThis = false
    @State private var showShareSheet: Bool = false
    let shareImage = UIImage(named: "appIcon")
    
    
    var body: some View {
        VStack {
            ScrollView(.vertical, showsIndicators: true) {
                
                topImage()
                
                detailInfoView()
                
                InfoView()
            }
            .bounce(false)
            
        }
        .navigationBarBackButtonHidden(true)
        .navigationTitle("")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                shareButton()
            }
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                customBackButton()
            }
        }
    }
    
    //MARK: - 상단 mock 이미지
    @ViewBuilder
    private func topImage() -> some View {
        VStack {
            Image("shoes")
                .resizable()
                .frame(height: 350)
        }
    }
    
    //MARK: - 공유 버튼
    @ViewBuilder
    private func shareButton() -> some View {
        HStack {
            Image(systemName: "arrow")
            
            Button {
                showShareSheet.toggle()
            } label: {
                Image(systemName: "square.and.arrow.up")
                    .frame(width: 20, height: 28)
                    .foregroundColor(.black)
            }
            .sheet(isPresented: $showShareSheet) {
                if let image  = shareImage {
                    ShareView(activityItems: [image])
                        .presentationDetents([.height(UIScreen.screenHeight / 2)])
                } else {
                    ShareView(activityItems: [shareImage ?? nil])
                        .presentationDetents([.height(UIScreen.screenHeight / 2)])
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
                .foregroundColor(Color.colorAsset.lightBlack)
        }

    }
    //MARK: - 가격및 info 화면
    @ViewBuilder
    private func detailInfoView() -> some View {
        HStack {
            VStack {
                Text("Maison Kitsune")
                    .font(.system(size: 15, weight: .bold, design: .monospaced))
                    .frame(width: 250, height: 20, alignment: .leading)
                Text("더블 폭스 패치 스니커즈")
                    .font(.system(size: 18, weight: .medium, design: .default))
                    .frame(width: 250, height: 20, alignment: .leading)
                Text("281,000원")
                    .font(.system(size: 15, weight: .bold, design: .monospaced))
                    .frame(width: 250, height: 20, alignment: .leading)
            }
            
            VStack {
                Image(systemName: "star.fill").resizable()
                    .frame(width: 30, height: 30, alignment: .center)
                    .foregroundColor(.yellow)
                Text("4.5")
                    .font(.system(size: 18, weight: .medium, design: .default))
            }.frame(width: 50)
            
            VStack(alignment: .center) {
                Button(action: {
                    //좋아요 액션 ( 클릭시 heart.fill )
                }) {
                    Image(systemName: "heart")
                        .resizable()
                        .renderingMode(.original)
                        .frame(width: 30, height: 30)
                }
                
                Text("LIKE")
                    .font(.system(size: 18, weight: .medium, design: .default))
            }.frame(width: 50)
        }
        .padding(.top, 10)
        .padding(.bottom, 10)
    }
}
struct ProductView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ProductView()
        }
    }
}
