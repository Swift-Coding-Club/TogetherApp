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
                
                Spacer()
            }
            //MARK: - textField
            HStack{
                if showPassword == false {
                    TextField(placeholder, text: $text)
                        .nanumSquareNeo(family: .bRG, size: 20, color: Color.fontColor.secondaryTextColor)
                        .disableAutocorrection(true)
                        .overlay(
                            Image(systemName: "xmark.circle.fill")
                                .padding()
                                .offset(x: 10)
                                .foregroundColor(Color.fontColor.secondaryTextColor)
                                .opacity(text.isEmpty ? .zero : 1.0)
                                .onTapGesture {
                                    UIApplication.shared.endEditing()
                                    text = ""
                                }
                            ,alignment: .trailing
                        )
                } else  {
                    SecureField(placeholder, text: $text)
                        .nanumSquareNeo(family: .bRG, size: 20, color: Color.fontColor.secondaryTextColor)
                }
                
                if showPassword == true {
                    Button {
                        showPassword.toggle()
                    } label: {
                        Image(systemName: "eye.slash")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 20, height: 20)
                            .nanumSquareNeo(family: .eHv, size: 15, color: Color.fontColor.secondaryTextColor)
                        
                    }
                } else {
                    EmptyView()
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
