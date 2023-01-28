//
//  SignUPNickNameView.swift
//  MarketApp
//
//  Created by 서원지 on 2023/01/20.
//

import SwiftUI
import ExytePopupView

struct SignUPNickNameView: View {
    
    @StateObject var viewModel: SignUPViewModel = SignUPViewModel()
    
    @State var nickNameTextField: String = ""
    @State private var showProfileView: Bool = false
    @State private var checkNickName: Bool = false
    
    
    var body: some View {
        VStack{
            
            Spacer()
                .frame(height:  40)
            
            signUPNicknameHeader()
            
            Spacer()
                .frame(height: 40)
            
            nickNameInputView()
            
            Spacer()
                .frame(height: 220)
            
            nicknameSignUPButton()
            
            Spacer(minLength: .zero)
        }
        .fullScreenCover(isPresented: $showProfileView) {
            NavigationStack {
                MainContentView()
            }
        }
        
        .popup(isPresented: $checkNickName, type: .floater(verticalPadding: 20), autohideIn: 2, closeOnTap: true, closeOnTapOutside: true) {
                SignupPopupVIew(image: "person", title: "회원가입 양식을 확인 해주세요", alertMessage: "닉네임을 한번 더 확인해주세요")
            }
    }
    //MARK: - 타이틀 헤더
    @ViewBuilder
    private func  signUPNicknameHeader() -> some View {
        HStack{
            Text("닉네임을 입력해주세요")
                .nanumSquareNeo(family: .eHv, size: 30, color: .black)
            
            Spacer()
        }
        .padding(.horizontal, LayoutMargin)
    }
    //MARK: - 닉네임 텍스트 필드
    @ViewBuilder
    private func nickNameInputView() -> some View {
        VStack{
            SignUPTextFieldView(placeholder: "닉네임을 입력해주세요", signUpText: "닉네임", password: false, text: $nickNameTextField, showPassword: .constant(false))
        }
    }
    //MARK: - 회원가입 완료 버튼
    @ViewBuilder
    private func nicknameSignUPButton() -> some View {
        HStack{
            Button {
                viewModel.saveUserInformation(nickName: nickNameTextField)
                checkRegister()
            } label: {
                Text("다음")
                    .nanumSquareNeo(family: .cBd, size: 17, color: .white)
                    .background (
                        RoundedRectangle(cornerRadius: 10)
                            .fill(.black)
                            .frame(width: UIScreen.screenWidth - 60, height: 44)
                        )
            }
            .disabled(nickNameTextField.isEmpty)

        }
    }
    
    //MARK: - 유효성 검사
    func checkRegister() {
        if !CheckRegister.isValidateNickName(nickNameTextField) {
            checkNickName.toggle()
        } else {
            showProfileView.toggle()
        }
    }
}

struct SignUPNickNameView_Previews: PreviewProvider {
    static var previews: some View {
        SignUPNickNameView()
    }
}
