//
//  ReadyPopUPview.swift
//  MarketApp
//  서비스 준비중 팝업
//  Created by 서원지 on 2022/12/19.
//

import SwiftUI

struct ReadyPopUPview: View {
    private var title: String = "서비스 준비중 "
    private var message: String = "서비스 준비중입니다"
    private var cancelTitle: String = "취소"
    private var confiremTitle: String = "확인"
    
    @State var closedAlert: Bool = false
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack(alignment: .center) {
            customAlertTitle()
            
            Spacer()
                .frame(height: 22)
            
            alertConfirmButton()
        }
        .padding(EdgeInsets(top: 40, leading: 30, bottom: 31, trailing: 30))
        .frame(width: ContentsWidth, height: 200)
        .background(.gray)
        .cornerRadius(30.0)
        .shadow(color: .black.opacity(0.4), radius: 6, x: 0, y: .zero)
        .animation(.easeOut)
        .edgesIgnoringSafeArea(.all)
    }
    
    
    @ViewBuilder
    private func customAlertTitle() -> some View {
        Text(title)
            .kerning(-0.36)
            .font(.system(size: 22))
            .foregroundColor(.white)
            .frame(width: ContentsWidth - 60)
        
        Spacer()
            .frame(height: 13)
        
        Text(message)
            .kerning(-0.3)
            .font(.system(size: 18))
            .foregroundColor(.white)
            .fixedSize(horizontal: false, vertical: true)
            .multilineTextAlignment(.center)
            .frame(width: ContentsWidth-60)
    }

    //MARK: -  알림 버튼 취소 확인 버튼
    @ViewBuilder
    private func alertConfirmButton() -> some View {
        HStack {
            Button {
                self.closedAlert = false
            } label: {
                Text(cancelTitle)
                    .kerning(-0.34)
                    .font(.system(size: 18))
                    .foregroundColor(.white)
                    .frame(width: 140, height: 40)
                    .overlay(
                        RoundedRectangle(cornerRadius: 30)
                            .stroke(Color.white, lineWidth: 1)
                            .frame(width: 140, height: 40)
                    )
            }
            .frame(width: 140, height: 40)
//            .background(Color.colorAssets.white)
            .cornerRadius(30.0)
            .shadow(color: .white.opacity(0.4), radius: 6, x: 0, y: 3)
            
            Spacer()
                .frame(width: 30)
            
            Button {
                self.closedAlert = false
            } label: {
                Text(confiremTitle)
                    .kerning(-0.34)
                    .font(.system(size: 18))
                    .foregroundColor(.blue.opacity(0.4))
                    .frame(width: 140, height: 40)
            }
            .frame(width: 140, height: 40)
            .background(.white)
            .cornerRadius(30.0)
            .shadow(color: .white.opacity(0.4), radius: 6, x: 0, y: 3)
        }
    }
}

struct ReadyPopUPview_Previews: PreviewProvider {
    static var previews: some View {
        ReadyPopUPview()
    }
}
