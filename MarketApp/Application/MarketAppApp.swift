//
//  MarketAppApp.swift
//  MarketApp
//
//  Created by 홍태희 on 2022/10/25.
//

import SwiftUI
import GoogleSignIn
import FirebaseAppCheck

@main
struct MarketAppApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject var loginViewModel: SignUPViewModel = SignUPViewModel()
    @State private var showLanchView: Bool = true
    let providerFactory = AffinityAppCheck()
    
    init() {
        AppCheck.setAppCheckProviderFactory(providerFactory)
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor(Color.black)]
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor : UIColor(Color.black)]
        UINavigationBar.appearance().tintColor = UIColor(Color.black)
    }
    
    var body: some Scene {
        WindowGroup {
            ZStack {
                MainTabView()
                    .environmentObject(loginViewModel)
                
                ZStack {
                    if showLanchView {
                        LanuchView(showLanchView: $showLanchView)
                    }
                }
            }
        }
    }
}
