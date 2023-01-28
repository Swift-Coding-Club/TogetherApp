//
//  MarketAppApp.swift
//  MarketApp
//
//  Created by 홍태희 on 2022/10/25.
//

import SwiftUI
import GoogleSignIn

@main
struct MarketAppApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject var loginViewModel: SignUPViewModel = SignUPViewModel()
    
    init() {
        
        UINavigationBar.appearance().tintColor = UIColor(Color.colorAsset.mainColor)
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                MainContentView()
            }
        }
    }
}
