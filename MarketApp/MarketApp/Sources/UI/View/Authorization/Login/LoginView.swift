//
//  LoginView.swift
//  MarketApp
//
//  Created by 서원지 on 2022/12/31.
//

import SwiftUI
import AuthenticationServices
import Firebase
import PopupView

struct LoginView: View {
    
    @StateObject var viewModel : SignUPViewModel = SignUPViewModel()
    
    @StateObject var profileViewModel = ProfileViewModel()
    @Environment(\.dismiss) var dismiss
    
    @State private var emailTextField: String = ""
    @State private var passwordTextField: String = ""
    @State private var showPassword: Bool = false
    @State private var selectedLoginSignType: LoginItem = .findEmail
    @State private var showFindEmailView: Bool = false
    @State private var showFindPasswordView: Bool = false
    @State private var showSignUPView: Bool = false
    @State private var loginErrorPopUp: Bool = false
    @State private var loginPopUP: Bool = false
    @State private var confirmAction: Bool = false
    @State private var showMainView : Bool = false
    @State private var isLoggingIn = false
    
    
    var body: some View {
        NavigationStack{
            ZStack{
                Color.white
                    .ignoresSafeArea()
                
                ScrollView(.vertical, showsIndicators: false) {
                    Group{
                        VStack(spacing: .zero) {
                            
                            Spacer()
                                .frame(height: modalTopTransparentSize - 40)
                            
                            titleButton()
                            
                            loginTitle()
                            
                            loginTextField()
                            
                            Spacer()
                                .frame(height: 60)
                            
                            loginButton()
                            
                            Spacer()
                                .frame(height: 50)
                            
                            loginWithApple()
                            
                            loginWithGoogle()
                            
                            Spacer(minLength: .zero)
                        }
                    }
                }
                .bounce(false)
            }
            
            .navigationDestination(isPresented: $showMainView) {
                MainTabView()
                .navigationBarHidden(true)
            }
            
            .navigationDestination(isPresented: $showFindEmailView) {
                FindEmailView()
            }
            .navigationDestination(isPresented: $showFindPasswordView) {
                FindPasswordView()
            }
            .navigationDestination(isPresented: $showSignUPView) {
                SignUPView()
            }
        }
        .navigationBarHidden(true)
        .popup(isPresented: $loginErrorPopUp) {
            POPUPViews(title: "로그인 에러", message: "아이디와 비밀 번호를 한번 확인 해주세요", cancelTitle: "취소", confiremTitle: "확인", color: Color.colorAsset.mainColor)
        } customize: { view in
            view
                .type(.default)
                .position(.bottom)
                .animation(.spring())
                .autohideIn(2)
                .closeOnTap(true)
                .closeOnTapOutside(true)
        }
        
        .popup(isPresented: $loginPopUP) {
            POPUPViews(title: "로그인 하기", message: "로그인을 해주세요", cancelTitle: "취소", confiremTitle: "확인", color: Color.colorAsset.mainColor)
        } customize: { popup in
            popup
                .type(.default)
                .position(.bottom)
                .animation(.spring())
                .autohideIn(2)
                .closeOnTap(true)
                .closeOnTapOutside(true)
        }
       
//        .fullScreenCover(isPresented: $showMainView) {
//            NavigationStack {
//                MainTabView()
//            }
//        }
    }
    //MARK: - 앱 로고
    @ViewBuilder
    private func titleButton() -> some View{
        HStack{
            Spacer()
            Button {
                dismiss()
            } label: {
                Image(systemName: "xmark")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .aspectRatio(contentMode: .fill)
                    .foregroundColor(Color.fontColor.secondaryTextColor)
            }
        }
        .padding(.horizontal, 30)
    }
    
    @ViewBuilder
    private func loginTitle() -> some View {
        VStack{
            Spacer()
                .frame(height: UIScreen.screenWidth / 10)
            Text("AFFINITY")
                .nanumSquareNeo(family: .eHv, size: 50, color: Color.fontColor.fontColor)
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
            
            CustomInputField(placeHolderText: "OOOOOOO@mail.com", color: Color.fontColor.secondaryTextColor, password: false, text: $emailTextField, showPassword: .constant(true))
            
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
            
            CustomInputField(placeHolderText: "비밀번호 ", color: Color.fontColor.secondaryTextColor, password: true, text: $passwordTextField, showPassword: $showPassword)
        }
    }
    //MARK:  - 로그인 버튼
    @ViewBuilder
    private func loginButton() -> some View {
        VStack {
            Button {
                viewModel.login(withEmail: emailTextField, password: passwordTextField)
                UIApplication.shared.endEditing()
            } label: {
                Text("로그인")
                    .nanumSquareNeo(family: .bRG, size: 22, color: .white)
                    .background {
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color.colorAsset.lightBlack)
                            .frame(width: UIScreen.screenWidth - 80, height: 50)
                    }
            }
            //            .disabled(emailTextField.isEmpty  || passwordTextField.isEmpty)
            .onChange(of: viewModel.loginStatus) { _ in
                if viewModel.loginStatus { // loginStatus가 변경됐을 때
                    showMainView.toggle()
                } else {
                    loginCheck()
                }
            }
            
            Spacer()
                .frame(height: 40)
            
            HStack(spacing: 20) {
                Button {
                    showFindEmailView.toggle()
                } label: {
                    Text("아이디 찾기")
                        .nanumSquareNeo(family: .bRG, size: 12, color:  .white)
                        .padding(EdgeInsets(top: 10, leading: 22, bottom: 10, trailing: 22))
                        .background(Color.colorAsset.lightBlack)
                        .clipShape(Capsule())
                }
                
                Button {
                    showFindPasswordView.toggle()
                } label: {
                    Text("비밀번호 찾기")
                        .nanumSquareNeo(family: .bRG, size: 12, color:  .white)
                        .padding(EdgeInsets(top: 10, leading: 22, bottom: 10, trailing: 22))
                        .background(Color.colorAsset.lightBlack)
                        .clipShape(Capsule())
                }
                
                Button {
                    showSignUPView.toggle()
                } label: {
                    Text("이메일 가입")
                        .nanumSquareNeo(family: .bRG, size: 12, color:  .white)
                        .padding(EdgeInsets(top: 10, leading: 22, bottom: 10, trailing: 22))
                        .background(Color.colorAsset.lightBlack)
                        .clipShape(Capsule())
                }
            }
        }
    }
    //MARK: - 로그인 검사
    private func loginCheck() {
        if emailTextField.isEmpty {
            loginPopUP = true
        } else if !CheckRegister.isValidateEmail(emailTextField) {
            loginErrorPopUp = true
        }else if passwordTextField.isEmpty {
            loginPopUP = true
        }else if !CheckRegister.isValidatePassword(passwordTextField) {
            loginErrorPopUp = true
        } else if emailTextField != emailTextField {
            loginErrorPopUp = true
        }
    }
    
    //MARK:  - 애플 로그인
    @ViewBuilder
    private func loginWithApple() -> some View {
        SignInWithAppleButton(.signIn) { request in
            viewModel.nonce =   AppleLoginManger.shared.randomNonceString()
            request.requestedScopes = [.fullName, .email]
            request.nonce =  AppleLoginManger.shared.sha256(viewModel.nonce)
        } onCompletion: { result in
            switch result {
            case .success(let authResults):
                
                print("로그인 성공 \(authResults)")
                
                guard let credential =  authResults.credential as?
                        ASAuthorizationAppleIDCredential  else  {
                    debugPrint("파이어 베이스 로그인 에러 ")
                    return
                }
                viewModel.appleLogin(credential: credential)
//                DispatchQueue.main.asyncAfter(deadline:.now() +  1) {
//                    showMainView.toggle()
//                }
                    
                    
            case .failure(let error):
                print("Authorisation failed: \(error.localizedDescription)")
            }
        }
        .signInWithAppleButtonStyle(.black)
        .frame(height: 50)
        .cornerRadius(10)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.colorAsset.backGroudColor, lineWidth: 1)
        )
        .padding(.horizontal, 40)
    }
    
    //MARK: - 구글 로그인
    @ViewBuilder
    private func loginWithGoogle() -> some View {
        Spacer()
            .frame(height: 20)
        
        Button{
            viewModel.googleLogin()
//            DispatchQueue.main.asyncAfter(deadline:.now() +  1) {
//                showMainView.toggle()
//            }
        } label: {
            HStack(spacing: 10) {
                
                Spacer()
                
                Image("google_logo")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .foregroundColor(Color.black)
                
                Text("구글 계정으로 로그인")
                    .nanumSquareNeo(family: .cBd, size: 20, color: Color.white)
                
                Spacer()
            }
        }
        
        .frame(height: 50)
        .background(Color.colorAsset.lightBlack)
        .cornerRadius(10)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.colorAsset.lightBlack, lineWidth: 1)
            
        )
        .padding(.horizontal, 40)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            LoginView()
        }
    }
}
