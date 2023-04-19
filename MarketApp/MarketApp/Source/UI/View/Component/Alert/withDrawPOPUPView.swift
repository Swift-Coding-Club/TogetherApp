//
//  withDrawPOPUPView.swift
//  MarketApp
//
//  Created by 서원지 on 2023/02/06.
//

import SwiftUI

struct withDrawPOPUPView: View {
    var title: String
    var message: String
    var cancelTitle: String = "취소"
    var confiremTitle: String = "확인"
    
    @State var closedAlert: Bool = false
    var confirmAction: () -> Void = {}
    
    var body: some View {
        VStack(alignment: .center) {
            customAlertTitle()
            
            Spacer()
                .frame(height: 22)
            
            alertConfirmButton()
        }
        .padding(EdgeInsets(top: 40, leading: 30, bottom: 31, trailing: 30))
        .frame(width: ContentsWidth, height: 200)
        .background(Color.colorAsset.mainColor)
        .cornerRadius(30.0)
        .shadow(color: Color.fontColor.secondaryTextColor, radius: 6, x: 0, y: .zero)
        .animation(.easeOut)
        .edgesIgnoringSafeArea(.all)
    }
    //MARK: - 알림창  타이틀 및  메세지
    @ViewBuilder
    private func customAlertTitle() -> some View {
        Text(title)
            .kerning(-0.36)
            .nanumSquareNeo(family: .bRG, size: 22, color: .white)
            .frame(width: ContentsWidth - 60)
        
        Spacer()
            .frame(height: 13)
        
        Text(message)
            .kerning(-0.3)
            .nanumSquareNeo(family: .bRG, size: 18, color: .white)
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
                    .nanumSquareNeo(family: .cBd, size: 18, color: .white)
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
                confirmAction()
            } label: {
                Text(confiremTitle)
                    .kerning(-0.34)
                    .nanumSquareNeo(family: .cBd, size: 18, color: Color.fontColor.secondaryTextColor)
                    .frame(width: 140, height: 40)
            }
            .frame(width: 140, height: 40)
            .background(Color.white)
            .cornerRadius(30.0)
            .shadow(color: Color.white.opacity(0.4), radius: 6, x: 0, y: 3)
        }
    }
}

struct withDrawPOPUPView_Previews: PreviewProvider {
    static var previews: some View {
        withDrawPOPUPView(title: "회원탈퇴", message: "회원탈퇴") {}
    }
}
