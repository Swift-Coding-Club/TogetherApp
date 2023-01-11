//
//  NoLoginView.swift
//  MarketApp
//
//  Created by 서원지 on 2023/01/12.
//

import SwiftUI

struct NoLoginView: View {
    @State var loginView: Bool = false
    @Environment(\.dismiss) var dismiss
    @StateObject var viewModel : SignUPViewModel
    
    var body: some View {
        VStack{
            Text("프로필 및  더 자세한 정보를 보고싶으면")
            Text("로그인 버튼를 눌러 로그인 을 하세요")
            
            Spacer()
                .frame(height: 40)
            
            Button {
                loginView.toggle()
            } label: {
                Text("로그인 하러 가기")
                    .nanumSquareNeo(family: .cBd, size: 30, color: .white)
                    .background(
                        RoundedRectangle(cornerRadius: 15)
                            .fill(Color.colorAsset.mauve)
                            .frame(width: UIScreen.screenWidth - 80, height: 50)
                    )
            }
            
        }
        .sheet(isPresented: $loginView) {
            LoginView(viewModel: viewModel)
        }
    }
    
}

struct NoLoginView_Previews: PreviewProvider {
    static var previews: some View {
        NoLoginView(viewModel: dev.signUPViewModel)
    }
}
