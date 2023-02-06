//
//  SignUPView.swift
//  MarketApp
//
//  Created by 서원지 on 2023/01/09.
//

import SwiftUI
import ExytePopupView
import FirebaseAuth

struct SignUPView: View {
    @State private var emailTextField: String = ""
    @State private var passwordTextField: String = ""
    @State private var recheckPsswordTextField: String = ""
    @State private var showPassword: Bool = false
    @State private var recheckShowPassword: Bool = false
    @State private var checkEmail: Bool = false
    @State private var checkPassword: Bool = false
    @State private var recheckPassword: Bool = false
    @State private var showNickNameView: Bool = false
    @State private var checkOnePassword: Bool = false

    
    @StateObject var viewModel: SignUPViewModel = SignUPViewModel()
    
    
    var body: some View {
        VStack {
            Spacer()
                .frame(height:  40)
            signUPheader()
            
            Spacer()
                .frame(height: 30)
            
            signUPInputView()
            
            Spacer()
                .frame(height: 100)
            
            singUPNextViewButton()
            
            Spacer(minLength: .zero)
        }
        .navigationDestination(isPresented: $showNickNameView) {
            SignUPNickNameView()
        }
        
        .popup(isPresented: $checkEmail, type: .floater(verticalPadding: 20), autohideIn: 2, closeOnTap: true, closeOnTapOutside: true) {
            SignupPOPUPVIew(image: "envelope", title: "회원가입 양식을 확인 해주세요", alertMessage: "이메일을 확인 해주세요")
        }
        .popup(isPresented: $checkPassword, type: .floater(verticalPadding: 20), autohideIn: 2, closeOnTap: true, closeOnTapOutside: true) {
            SignupPOPUPVIew(image: "lock", title: "회원가입 양식을 확인 해주세요", alertMessage: "비밀번호를 입력해주세요")
        }
        .popup(isPresented: $recheckPassword, type: .floater(verticalPadding: 20), autohideIn: 2, closeOnTap: true, closeOnTapOutside: true) {
            SignupPOPUPVIew(image: "lock", title: "회원가입 양식을 확인 해주세요", alertMessage: "비밀번호를 입력해주세요")
        }
        
        .popup(isPresented: $checkOnePassword, type: .floater(verticalPadding: 20), autohideIn: 2, closeOnTap: true, closeOnTapOutside: true) {
            SignupPOPUPVIew(image: "lock", title: "회원가입 양식을 확인 해주세요", alertMessage: "비밀번호를 한번더 확인해주세요")
        }
        
    }
    
    @ViewBuilder
    private func signUPheader() -> some View {
        HStack{
            Text("회원가입")
                .nanumSquareNeo(family: .eHv, size: 30, color: Color.black)
            Spacer()
        }
        .padding(.horizontal, LayoutMargin)
    }
    
    //MARK: - 회원가입 텍스트 필드
    @ViewBuilder
    private func signUPInputView() -> some View {
        VStack(spacing: 20){
            SignUPTextFieldView(placeholder: "이메일 주소를 적어주세요", signUpText: "이메일 주소", password: false, text: $emailTextField, showPassword: .constant(false))
            
            SignUPTextFieldView(placeholder: "패스워드를 입력해주세요", signUpText: "비밀번호 ", password: true, text: $passwordTextField, showPassword: $showPassword)
            
            SignUPTextFieldView(placeholder: "패스워드를 한번더 입력해주세요", signUpText: "비밀번호 확인", password: true, text: $recheckPsswordTextField, showPassword: $recheckShowPassword)
        }
    }
    //MARK: - 회원가입 버튼
    @ViewBuilder
    private func singUPNextViewButton() -> some View {
        HStack{
            Button {
                checkRegister()
                viewModel.register(withEmail: emailTextField, password: passwordTextField, nickName: "")
            } label: {
                Text("다음")
                    .nanumSquareNeo(family: .cBd, size: 17, color: .white)
                    .background (
                        RoundedRectangle(cornerRadius: 10)
                            .fill(.black)
                            .frame(width: UIScreen.screenWidth - 60, height: 44)
                        )
            }
            .disabled(emailTextField.isEmpty || passwordTextField.isEmpty || recheckPsswordTextField.isEmpty)

        }
        
    }
    
    //MARK: - 유효성 검사
    private func checkRegister() {
        if !CheckRegister.isValidateEmail(emailTextField) {
            checkEmail = true
        } else if !CheckRegister.isValidatePassword(passwordTextField) {
            checkPassword = true
        } else if !CheckRegister.isValidatePassword(recheckPsswordTextField) {
            recheckPassword = true
        } else if passwordTextField != recheckPsswordTextField {
            checkOnePassword = true
        } else {
            showNickNameView.toggle()
        }
    }
}

struct SignUPView_Previews: PreviewProvider {
    static var previews: some View {
        SignUPView()
    }
}
