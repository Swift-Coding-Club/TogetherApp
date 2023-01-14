//
//  ReadyPopUPview.swift
//  MarketApp
//  서비스 준비중 팝업
//  Created by 서원지 on 2022/12/19.
//

import SwiftUI

struct PopUPview: View {
     var title: String
     var message: String
     var cancelTitle: String
     var confiremTitle: String
//    var confirmAction: () -> Void = {}
    var color: Color
    
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
        .background(color)
        .cornerRadius(30.0)
        .shadow(color: .black.opacity(0.4), radius: 6, x: 0, y: .zero)
        .animation(.easeOut)
        .edgesIgnoringSafeArea(.all)
    }
    
    
    @ViewBuilder
    private func customAlertTitle() -> some View {
        Text(title)
            .kerning(-0.36)
            .nanumSquareNeo(family: .cBd, size: 22, color: .white)
            .foregroundColor(.white)
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
                    .nanumSquareNeo(family: .bRG, size: 18, color: .white)
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
                    .nanumSquareNeo(family: .bRG, size: 18, color: .black.opacity(0.4))
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

struct PopUPview_Previews: PreviewProvider {
    static var previews: some View {
        PopUPview(title: "서비스 준비중", message: "서비스 준비중입니다", cancelTitle: "취소", confiremTitle: "확인", color: Color.colorAsset.gray)
    }
}
