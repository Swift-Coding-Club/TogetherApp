//
//  SignUPTextFieldView.swift
//  MarketApp
//
//  Created by 서원지 on 2023/01/19.
//

import SwiftUI

struct SignUPTextFieldView: View {
    
    var placeholder: String
    var signUpText: String
    var password: Bool
    
    @Binding var text: String
    @Binding var showPassword: Bool
    
    var body: some View {
        VStack {
            HStack{
                Text(signUpText)
                    .kerning(-0.08)
                    .nanumSquareNeo(family: .bRG, size: 15, color: .black)
                
                Spacer()
            }
            //MARK: - textField
            HStack{
                if showPassword == false {
                    TextField(placeholder, text: $text)
                        .nanumSquareNeo(family: .cBd, size: 15, color: Color.fontColor.secondaryTextColor)
                        .disableAutocorrection(true)
                        .textCase(.lowercase)

                } else if password == true {
                    SecureField(placeholder, text: $text)
                        .nanumSquareNeo(family: .cBd, size: 15, color: Color.fontColor.secondaryTextColor)
                        .disableAutocorrection(true)
                    
                }
                
                if password == true {
                    Button {
                        showPassword.toggle()
                    } label: {
                        Image(systemName: "eye.slash")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 20, height:  13)
                            .nanumSquareNeo(family: .eHv, size: 15, color: Color.fontColor.secondaryTextColor)
                    }
                } else {
                    Button {
                        UIApplication.shared.endEditing()
                        text = ""
                    } label: {
                        Image(systemName: "xmark.circle.fill")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 20, height: 20)
                            .nanumSquareNeo(family: .eHv, size: 15, color: Color.black)
                            .opacity(text.isEmpty ? .zero : 1.0)
                    }

                }
            }
            
            //MARK: - line
          Rectangle()
                .frame(height: 1)
                .foregroundColor(.black)
            
        }
        .padding(.horizontal, LayoutMargin)
    }
}
struct SignUPTextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        SignUPTextFieldView(placeholder: "닉네임임을 입력 해주세요", signUpText: "아이디", password: false, text: .constant(""), showPassword: .constant(false))
    }
}
