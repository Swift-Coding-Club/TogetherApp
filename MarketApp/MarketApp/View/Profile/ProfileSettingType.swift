//
//  ProfileSettingType.swift
//  MarketApp
//
//  Created by 서원지 on 2023/02/06.
//

import Foundation

enum ProfileSettingType: CaseIterable, CustomStringConvertible {
    case termsPolices
    case  connatAS
    case developer
 
    var description: String {
        switch self {
        case .termsPolices:
            return "약관 및 정책"
        case .connatAS:
            return "문의하기"
        case .developer:
            return "이앱을 만든 사람"
        }
    }
    
}
