//
//  NotificationManger.swift
//  MarketApp
//
//  Created by 서원지 on 2023/05/10.
//

import Firebase
import UserNotifications
import FirebaseMessaging
import UIKit

final class NotificationManger: NSObject, UNUserNotificationCenterDelegate, MessagingDelegate {
    static let shared = NotificationManger()
    
    private override init() {}
    
    func registerForPushNotifications(application: UIApplication) {
        UNUserNotificationCenter.current().delegate = self
        
        let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
        UNUserNotificationCenter.current().requestAuthorization(options: authOptions, completionHandler: {_, _ in })
        UIApplication.shared.registerForRemoteNotifications()
        
        Messaging.messaging().delegate = self
    }
    
    
    func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String?) {
        print("PushNotificationManager - 파베 토큰을 받았다.")
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
    //MARK: - push 메세지 처리
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        Messaging.messaging().apnsToken = deviceToken
        print("devoice token = \(deviceToken)")
        let deviceTokenString = deviceToken.map { String(format: "%02x", $0) }.joined()
        print("token = \(deviceTokenString)")
    }
    // 앱이 백그라운드나 종료되어 있는 상태에서 푸시 데이터 처리
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        print("PushNotificationManager - willPresentNotification = \(notification.request.content.userInfo)")
        
        let userInfo = notification.request.content.userInfo
        Messaging.messaging().appDidReceiveMessage(userInfo)
        
        completionHandler([.banner, .sound, .badge])
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        print("PushNotificationManager - didReceiveNotification = \(response.notification.request.content.userInfo)")
        
        let userInfo = response.notification.request.content.userInfo
        Messaging.messaging().appDidReceiveMessage(userInfo)
        
        completionHandler()
    }
}
