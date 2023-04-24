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


class AppDelegate: UIViewController, UIApplicationDelegate, MessagingDelegate, UNUserNotificationCenterDelegate {
    var remoteConfig: RemoteConfig!
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        FirebaseApp.configure()
        FirebaseConfiguration.shared.setLoggerLevel(FirebaseLoggerLevel.min)
        remoteConfig = RemoteConfig.remoteConfig()
        let settings = RemoteConfigSettings()
        settings.minimumFetchInterval = 0
        remoteConfig.configSettings = settings
        remoteConfig.setDefaults(fromPlist: "RemoteConfigDefaults")
        fetchConfig()
        
        UNUserNotificationCenter.current().delegate = self
        
        let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
        UNUserNotificationCenter.current().requestAuthorization(options: authOptions, completionHandler: {_, _ in })
        application.registerForRemoteNotifications()
//        application.applicationIconBadgeNumber = .zero
        
        // init fcm
        Messaging.messaging().delegate = self
        
        return true
    }
    
    func fetchConfig() {
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
        do {
            try Auth.auth().signOut()
        } catch let error {
            print("rror signing out: \(error.localizedDescription)")
        }
    }
    
    
    
    //MARK: - push 메세지 처리
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        Messaging.messaging().apnsToken = deviceToken
        print("devoice token = \(deviceToken)")
        let deviceTokenString = deviceToken.map { String(format: "%02x", $0) }.joined()
        print("token = \(deviceTokenString)")
    }
    
    func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String?) {
        print("AppDelegate - 파베 토큰을 받았다.")
        print("Firebase registration token: \(String(describing: fcmToken))")
        
        guard let currentToken = Messaging.messaging().fcmToken else { return }
        
        if currentToken != fcmToken {
            Messaging.messaging().token { token, error in
                if let error = error {
                    print("Error fetching FCM registration token: \(error.localizedDescription)")
                } else {
                    print("파이어 베이스 토큰: \(token)")
                    if let token = token {
                        AppManager.shared.fcmToken = token
                    }
                }
            }
        } else if let newToken = fcmToken {
            AppManager.shared.fcmToken = newToken
            print("토근 재생성 \(newToken)")
        }

        let dataDict:[String: String] = ["token": fcmToken ?? ""]
        NotificationCenter.default.post(name: Notification.Name("FCMToken"), object: nil, userInfo: dataDict)
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        print("willPresentNotification = \(notification.request.content.userInfo)")
        
        let userInfo = notification.request.content.userInfo
        Messaging.messaging().appDidReceiveMessage(userInfo)
        
//        if let sceneDelegate = UIApplication.shared.connectedScenes.first!.delegate as? SceneDelegate {
//            if let click_action = userInfo["click_action"], let url =  URL(string: click_action as! String){
//                sceneDelegate.handleDeepLink(url)
//            }
//        }
                                                        
        completionHandler([.banner, .sound, .badge])
    }
    
    // 앱이 백그라운드나 종료되어 있는 상태에서 푸시 데이터 처리
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        print("didReceiveNotification = \(response.notification.request.content.userInfo)")
        
        let userInfo = response.notification.request.content.userInfo
        Messaging.messaging().appDidReceiveMessage(userInfo)
        
        completionHandler()
    }
    
    func application(_ application: UIApplication, open url: URL,
                     options: [UIApplication.OpenURLOptionsKey: Any]) -> Bool {
        return GIDSignIn.sharedInstance.handle(url)
    }
}


