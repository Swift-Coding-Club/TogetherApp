//
//  ConfirmAlertView.swift
//  MarketApp
//
//  Created by 서원지 on 2022/12/19.
//

import SwiftUI

struct ConfirmAlertView: ViewModifier {
    var isPresented: Binding<Bool>
    let message: String
    let alertTitle: String
    let confirmTitle: String
    
    func body(content: Content) -> some View {
        content.alert(isPresented: isPresented) {
            Alert(title: Text(alertTitle)
                .font(.system(size: 15)),
                  message: Text(message)
                .font(.system(size: 15)),
                  //                .foregroundColor(Color.fontColor.mainFontColor),
                  dismissButton: .cancel(Text(confirmTitle)
                    .font(.system(size: 15))
                                         //                    .foregroundColor(Color.fontColor.mainFontColor))
                  )
            )
        }
    }
}

extension View {
    func showCheckAlertMessage(showAlert: Binding<Bool>, message: String, alertTitle: String, confirmTitle: String) -> some View {
        self.modifier(ConfirmAlertView(isPresented: showAlert, message: message, alertTitle: alertTitle, confirmTitle: confirmTitle))
    }
}
