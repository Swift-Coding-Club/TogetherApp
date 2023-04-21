//
//  BannerImages.swift
//  MarketApp
//
//  Created by 서원지 on 2023/03/03.
//

import Foundation
import SwiftUI


enum BannerImages: CaseIterable, CustomStringConvertible, Hashable {
    case abcMarket
    case nikeMarket
    case addidasMarket
    
    var description: String {
        switch self {
        case .abcMarket:
            return "ABC"
        case .nikeMarket:
            return "NIKE"
        case .addidasMarket:
            return "ADDIDAS"
        }
    }
    
    var bannerImage: String {
        switch self {
        case .abcMarket:
            return "ABC"
        case .nikeMarket:
            return "NIKE"
        case .addidasMarket:
            return "ADDIDAS"
        }
    }
    
    var bannerURL: String {
        switch self {
        case .abcMarket:
            return "https://abcmart.a-rt.com"
        case .nikeMarket:
            return "https://www.nike.com/kr"
        case .addidasMarket:
            return "https://www.adidas.co.kr"
        }
    }
}
