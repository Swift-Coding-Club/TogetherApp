//
//  AppCheck.swift
//  MarketApp
//
//  Created by 서원지 on 2023/01/28.
//

import Foundation
import FirebaseAppCheck
import Firebase

class AffinityAppCheck : NSObject, AppCheckProviderFactory {
    func createProvider(with app: FirebaseApp) -> AppCheckProvider? {
      if #available(iOS 14.0, *) {
        return AppAttestProvider(app: app)
      } else {
        return DeviceCheckProvider(app: app)
      }
    }
  }

