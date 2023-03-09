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
    
    var description: String {
        switch self {
        case .abcMarket:
            return "ABC"
        case .nikeMarket:
            return "NIKE"
        }
    }
    
    var bannerImage: String {
        switch self {
        case .abcMarket:
            return "ABC"
        case .nikeMarket:
            return "Nike"
        }
    }
    
    var bannerURL: String {
        switch self {
        case .abcMarket:
            return "https://abcmart.a-rt.com"
        case .nikeMarket:
            return "https://www.nike.com/kr"
        }
    }
}
