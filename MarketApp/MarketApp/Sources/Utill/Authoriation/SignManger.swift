//
//  SignManger.swift
//  MarketApp
//
//  Created by 서원지 on 2023/01/11.
//

import SwiftUI
import GoogleSignIn
import CryptoKit
import Firebase


struct LoginManger {
    static let shared = LoginManger()
    
    func getRootViewController()->UIViewController{
        guard let screen = UIApplication.shared.connectedScenes.first as? UIWindowScene else{
            return .init()
        }
        guard let root = screen.windows.first?.rootViewController else{
            return .init()
        }
        return root
    }
    
    func appDeleteSignout() {
        do  {
            try Auth.auth().signOut()
        } catch let error {
            print("error signing out: \(error.localizedDescription)")
        }
    }
    
}
