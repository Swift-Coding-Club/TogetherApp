//
//  MainNavigaionItem.swift
//  MarketApp
//
//  Created by 서원지 on 2022/12/24.
//

import Foundation

enum MainNavigaionItem: CaseIterable, CustomStringConvertible {
    case search
    case cart
     
    var description: String {
        switch self {
        case .search:
            return "search"
        case .cart:
            return "cart"
        }
    }
    
    var image: String {
        switch self {
        case .search:
            return "magnifyingglass"
        case .cart:
            return "cart"
        }
    }
}
