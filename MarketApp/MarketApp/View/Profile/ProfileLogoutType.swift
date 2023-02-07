//
//  ProfileLogoutType.swift
//  MarketApp
//
//  Created by 서원지 on 2023/02/06.
//

import Foundation

enum ProfileLogoutType: CaseIterable, CustomStringConvertible {
    case logout
    case withdrawal
    
    
    var description: String {
        switch self {
        case .logout:
            return "로그아웃"
        case .withdrawal:
            return "회원 탈퇴"
        }
    }
}
