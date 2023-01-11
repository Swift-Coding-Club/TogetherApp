//
//  MarketAppApp.swift
//  MarketApp
//
//  Created by 홍태희 on 2022/10/25.
//

import SwiftUI


@main
struct MarketAppApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject var loginViewModel: SignUPViewModel = .init()
    
    init() { }
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                MainContentView()
            }
        }
    }
}
