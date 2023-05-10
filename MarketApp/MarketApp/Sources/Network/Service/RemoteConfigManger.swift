//
//  RemoteConfigManger.swift
//  MarketApp
//
//  Created by 서원지 on 2023/05/10.
//

import Foundation
import FirebaseRemoteConfig
import Firebase

final class RemoteConfigManger {
    static let shared = RemoteConfigManger()
    
    var remoteConfig: RemoteConfig!
    
    private init() {
        FirebaseConfiguration.shared.setLoggerLevel(FirebaseLoggerLevel.min)
        remoteConfig = RemoteConfig.remoteConfig()
        let settings = RemoteConfigSettings()
        settings.minimumFetchInterval = 0
        remoteConfig.configSettings = settings
        remoteConfig.setDefaults(fromPlist: "RemoteConfigDefaults")
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
}

