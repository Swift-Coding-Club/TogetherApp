//
//  LoginView.swift
//  MarketApp
//
//  Created by 서원지 on 2022/12/31.
//

import SwiftUI
import AuthenticationServices
import Firebase

struct LoginView: View {
    @State private var emailTextField: String = ""
    @State private var passwordTextField: String = ""
    @State private var showPassword: Bool = false
    @State private var selectedLoginSignType: LoginItem = .findEmail
    @State private var showFindEmailView: Bool = false
    @State private var showFindPasswordView: Bool = false
    @State private var showSignUPView: Bool = false
    
    var body: some View {
        ZStack{
            Color.colorAsset.backGroudColor
                .ignoresSafeArea()
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: .zero) {
                    
                    loginTitle()
                    
                    loginTextField()
                    
                    Spacer()
                        .frame(height: 60)
                    
                    
                    loginButton()
                    
                    Spacer()
                        .frame(height: 40)
                    
                    loginWithApple()
                    
                    Spacer(minLength: .zero)
                }
            }
            .bounce(false)
        }
        .background(
            NavigationLink(destination: FindPasswordView(), isActive: $showPassword, label: {EmptyView()})
        )
                .background(
                    NavigationLink(destination: FindEmailView(), isActive: $showFindEmailView, label: {EmptyView()})
                )
        .background(
            NavigationLink(destination: SignUPView(), isActive: $showSignUPView, label: {EmptyView()})
        )
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
    //MARK: - 로그인 텍스트 필드
    @ViewBuilder
    private func loginTextField() -> some View {
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
            
            CustomInputField(placeHolderText: "OOOOOOO@mail.com", color: Color.fontColor.secondaryTextColor, text: $emailTextField, password: false, showPassword: .constant(false))
            
            Spacer()
                .frame(height: 30)
            
            HStack{
                Text("비밀 번호 ")
                    .nanumSquareNeo(family: .cBd, size: 14, color: Color.fontColor.secondaryTextColor)
                Spacer()
            }
            .padding(.horizontal, LayoutMargin)
            
            Spacer()
                .frame(height: 30)
            
            CustomInputField(placeHolderText: "비밀번호 ", color: Color.fontColor.secondaryTextColor, text: $passwordTextField, password: true, showPassword: $showPassword)
        }
    }
    //MARK:  - 로그인 버튼
    @ViewBuilder
    private func  loginButton() -> some View {
        VStack {
            
            Button {
                
            } label: {
                Text("로그인")
                    .nanumSquareNeo(family: .bRG, size: 22, color: .white)
                
                    .background {
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color.colorAsset.gray)
                            .frame(width: UIScreen.screenWidth - 80, height: 50)
                    }
                    .disabled(emailTextField.isEmpty  || passwordTextField.isEmpty)
            }
            
            Spacer()
                .frame(height: 40)
            
            HStack(spacing: 20){
                ForEach(LoginItem.allCases, id: \.description) { item in
                    if selectedLoginSignType == .findPassword {
                        Text(item.description)
                            .nanumSquareNeo(family: selectedLoginSignType == item ? .cBd : .bRG, size: 12, color:  selectedLoginSignType == item ?  .white :  .white.opacity(0.9))
                            .padding(EdgeInsets(top: 10, leading: 22, bottom: 10, trailing: 22))
                            .background(Color.colorAsset.gray)
                            .clipShape(Capsule())
                            .onTapGesture {
                                withAnimation(.easeInOut) {
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                                        self.selectedLoginSignType = item
                                        showFindPasswordView.toggle()
                                    }
                                }
                            }
                    } else if selectedLoginSignType == .findEmail {
                        Text(item.description)
                            .nanumSquareNeo(family: selectedLoginSignType == item ? .cBd : .bRG, size: 12, color:  selectedLoginSignType == item ?  .white :  .white.opacity(0.9))
                            .padding(EdgeInsets(top: 10, leading: 22, bottom: 10, trailing: 22))
                            .background(Color.colorAsset.gray)
                            .clipShape(Capsule())
                            .onTapGesture {
                                withAnimation(.easeInOut) {
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                                        self.selectedLoginSignType = item
                                        showFindEmailView.toggle()
                                    }
                                }
                            }
                    } else if selectedLoginSignType == .signUP {
                        Text(item.description)
                            .nanumSquareNeo(family: selectedLoginSignType == item ? .cBd : .bRG, size: 12, color:  selectedLoginSignType == item ?  .white :  .white.opacity(0.9))
                            .padding(EdgeInsets(top: 10, leading: 22, bottom: 10, trailing: 22))
                            .background(Color.colorAsset.gray)
                            .clipShape(Capsule())
                            .onTapGesture {
                                withAnimation(.easeInOut) {
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                                        self.selectedLoginSignType = item
                                        showSignUPView.toggle()
                                    }
                                }
                            }
                    }
                    
                }
                
            }
        }
    }
    //MARK:  - 애플 로그인
    @ViewBuilder
    private func loginWithApple() -> some View {
        SignInWithAppleButton(.signIn) { _  in
            
        } onCompletion: { _ in
            
        }
        .signInWithAppleButtonStyle(.black)
        .frame(height: 50)
        .cornerRadius(10)
        .padding(.horizontal, 40)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
