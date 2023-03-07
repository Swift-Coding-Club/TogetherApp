//
//  BrandType.swift
//  MarketApp
//
//  Created by 서원지 on 2023/03/03.
//

import Foundation

enum BrandType:  Int , CaseIterable, CustomStringConvertible {
    case all
    case nike
    case adidas
    case converse
    case jordan
    case miharaYasuhiro
    case newBalance
    
    var description: String {
        switch self {
        case .all:
            return "전체"
        case .nike:
            return "나이키"
        case .adidas:
            return "아디다스"
        case .converse:
            return "컨버스"
        case .jordan:
            return "조던"
        case .miharaYasuhiro:
            return "Mihara Yasuhiro"
        case .newBalance:
            return "뉴발"
        }
    }
    
    var brandDescription: String {
        switch self {
        case .all:
            return ""
        case .nike:
            return "Nike"
        case .adidas:
            return "Adidas"
        case .converse:
            return "Converse"
        case .jordan:
            return "Jordan"
        case .miharaYasuhiro:
            return "Mihara Yasuhiro"
        case .newBalance:
            return "New Balance"
        }
    }
}
