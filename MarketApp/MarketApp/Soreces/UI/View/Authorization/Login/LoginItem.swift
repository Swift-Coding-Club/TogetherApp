//
//  LoginItem.swift
//  MarketApp
//
//  Created by 서원지 on 2023/01/09.
//

import Foundation

enum LoginItem: CaseIterable , CustomStringConvertible   {
    case findEmail
    case findPassword
    case signUP
    
    var description: String {
        switch self {
        case .findEmail:
            return "이메일 찾기"
        case .findPassword:
            return "비밀번호 찾기"
        case .signUP:
            return "이메일 가입"
        }
    }
}

