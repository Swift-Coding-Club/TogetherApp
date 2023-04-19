//
//  AppManger.swift
//  MarketApp
//
//  Created by 서원지 on 2023/01/28.
//

import Foundation
import UIKit

class AppManager {
    static let shared = AppManager()
    let keyFCMToken = "KEY_FCM_TOKEN"
    
    var currentAppVersion: String? {
        guard let dictionary = Bundle.main.infoDictionary, let version = dictionary["CFBundleShortVersionString"] as? String else {
            return nil
        }
        
        return version
    }
    
    var fcmToken: String {
        get {
            return UserDefaults.standard.string(forKey: keyFCMToken) ?? ""
        }
        set(newValue) {
            UserDefaults.standard.set(newValue, forKey: keyFCMToken)
            UserDefaults.standard.synchronize()
            
            let dataDict: [String: String] = ["token": newValue]
            NotificationCenter.default.post(
                name: Notification.Name("FCMToken"),
                object: nil,
                userInfo: dataDict
            )
        }
    }
}


extension AppManager {
//    func compareVersion(versionA:String!, versionB:String!) -> ComparisonResult {
//        let majorA = Int(Array(versionA.split(separator: "."))[0])!
//        let majorB = Int(Array(versionB.split(separator: "."))[0])!
//
//        if majorA > majorB {
//            return ComparisonResult.orderedDescending
//        } else if majorB > majorA {
//            return ComparisonResult.orderedAscending
//        }
//
//        let minorA = Int(Array(versionA.split(separator: "."))[1])!
//        let minorB = Int(Array(versionB.split(separator: "."))[1])!
//        if minorA > minorB {
//            return ComparisonResult.orderedDescending
//        } else if minorB > minorA {
//            return ComparisonResult.orderedAscending
//        }
//        
//        let patchA = Int(Array(versionA.split(separator: "."))[2])!
//        let patchB = Int(Array(versionB.split(separator: "."))[2])!
//        if patchA > patchB {
//            return ComparisonResult.orderedDescending
//        } else if patchB > patchA {
//            return ComparisonResult.orderedAscending
//        }
//        return ComparisonResult.orderedSame
//    }
}
