//
//  ACarouselAutoScroll.swift
//  MarketApp
//
//  Created by 서원지 on 2023/02/03.
//

import Foundation

@available(iOS 13.0, *)
public enum ACarouselAutoScroll {
    case inactive
    case active(TimeInterval)
}


extension ACarouselAutoScroll {
    
    /// default active
    public static var defaultActive: Self {
        return .active(5)
    }
    
    /// Is the view auto-scrolling
    var isActive: Bool {
        switch self {
        case .active(let t): return t > 0
        case .inactive : return false
        }
    }
    
    /// Duration of automatic scrolling
    var interval: TimeInterval {
        switch self {
        case .active(let t): return t
        case .inactive : return 0
        }
    }
}
