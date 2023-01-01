//
//  LoginView.swift
//  MarketApp
//
//  Created by 서원지 on 2022/12/31.
//

import SwiftUI

struct LoginView: View {
    @State private var emailTextField: String = ""
    @State private var passwordTextField: String = ""
    @State private var showPassword: Bool = false
    
    var body: some View {
        ZStack{
            Color.colorAsset.backGroudColor
                .ignoresSafeArea()
            
            VStack(spacing: .zero) {
                
                loginTitle()
                
                emailLogin()
                  
                
                Spacer(minLength: .zero)
            }
        }
     }
    //MARK: - 앱 로고
    @ViewBuilder
    private func loginTitle() -> some View {
        VStack{
            Spacer()
                .frame(height: UIScreen.screenWidth / 5)
            Text("FANCY")
                .nanumSquareNeo(family: .eHv, size: 50, color: .black)
        }
        .padding(.horizontal, LayoutMargin)
    }
    
    @ViewBuilder
    private func emailLogin() -> some View {
        VStack{
            Spacer()
                .frame(height: 80)
            
            HStack{
                Text("이메일 로그인")
                    .nanumSquareNeo(family: .cBd, size: 14, color: Color.fontColor.fontColor)
                Spacer()
            }
            .padding(.horizontal, LayoutMargin)
            
            Spacer()
                .frame(height: 30)
            
            CustomInputField(imageName: "envelope", placeHolderText: "이메일", text: $emailTextField, password: false, showPassword: .constant(false))
            
            Spacer()
                .frame(height: 30)
            
            HStack{
                Text("비밀 번호 ")
                    .nanumSquareNeo(family: .cBd, size: 14, color: Color.fontColor.fontColor)
                Spacer()
            }
            .padding(.horizontal, LayoutMargin)
            
            Spacer()
                .frame(height: 30)
            
            CustomInputField(imageName: "lock", placeHolderText: "비밀번호 ", text: $passwordTextField, password: true, showPassword: $showPassword)
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
