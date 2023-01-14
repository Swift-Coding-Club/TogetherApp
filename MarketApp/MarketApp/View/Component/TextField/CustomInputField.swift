//
//  CustomInputField.swift
//  MarketApp
//
//  Created by 서원지 on 2022/12/31.
//

import SwiftUI

struct CustomInputField: View {
    let placeHolderText: String
    let color: Color
    let password: Bool
    
    @Binding var text: String
    @Binding var showPassword: Bool
    
    var body: some View {
        VStack{
            HStack{ 
                if showPassword == true {
                    SecureField(placeHolderText, text: $text)
                        .nanumSquareNeo(family: .bRG, size: 20, color: Color.fontColor.secondaryTextColor)
                } else {
                    TextField(placeHolderText, text: $text)
                        .nanumSquareNeo(family: .bRG, size: 20, color: Color.fontColor.secondaryTextColor)
                }
                
                if password == true {
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
            .padding()
            .overlay(
            RoundedRectangle(cornerRadius: 15)
                .stroke(Color(.darkGray), lineWidth: 1)
                .shadow(color: .gray.opacity(0.5), radius: 10, x: .zero, y: .zero)
            )
        }
        .background(color.opacity(0.2))
        .cornerRadius(15)
        .padding(20)
        .frame(width: UIScreen.screenWidth , height: 50)
    }
}

struct CustomInputField_Previews: PreviewProvider {
    static var previews: some View {
        CustomInputField(placeHolderText: "Email", color: Color.fontColor.secondaryTextColor, password: true, text: .constant(""), showPassword: .constant(true))
    }
}
