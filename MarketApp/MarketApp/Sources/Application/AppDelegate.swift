//
//  AppDelegate.swift
//  MarketApp
//
//  Created by 서원지 on 2022/12/25.
//

import SwiftUI
import FirebaseCore
import UIKit
import GoogleSignIn
import FirebaseRemoteConfig
import FirebaseMessaging
import Firebase
import FirebaseDynamicLinks


class AppDelegate: UIViewController, UIApplicationDelegate {
    var remoteConfig: RemoteConfig!
    
    //MARK: - 앱이 시작 되었을때
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        FirebaseApp.configure()
//        FirebaseConfiguration.shared.setLoggerLevel(FirebaseLoggerLevel.min)
//        remoteConfig = RemoteConfig.remoteConfig()
//        let settings = RemoteConfigSettings()
//        settings.minimumFetchInterval = 0
//        remoteConfig.configSettings = settings
//        remoteConfig.setDefaults(fromPlist: "RemoteConfigDefaults")
        RemoteConfigManger.shared.fetchConfig()
        
        NotificationManger.shared.registerForPushNotifications(application: application)
        
        return true
    }
    
    func fetchConfig() {
        print("remoteconfig 호출")
        remoteConfig.fetch() { (status, error)  in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            if status == .success {
                self.remoteConfig.activate() { (change, error) in
                    guard let minVersion = self.remoteConfig["ios_lastest_version"].stringValue else {
                        return
                    }
                }
            }
        }
    }
    
    //MARK: -  앱이 삭제 되었을때  로그아웃 처리
    func applicationWillTerminate(_ application: UIApplication) {
        LoginManger.shared.appDeleteSignout()
    }
        
    func application(_ application: UIApplication, open url: URL,
                     options: [UIApplication.OpenURLOptionsKey: Any]) -> Bool {
        return GIDSignIn.sharedInstance.handle(url)
    }
}


