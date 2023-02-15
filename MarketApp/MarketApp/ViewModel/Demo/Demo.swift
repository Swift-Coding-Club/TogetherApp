//
//  Demo.swift
//  MarketApp
//
//  Created by 서원지 on 2023/02/01.
//

import Foundation
import SwiftUI


let bannerImages  = ["blue", "pink" , "yellow"]

enum demoImage : String, CaseIterable, Hashable {
    case one = "blue"
    case two = "pink"
    case three = "yellow"
}

enum demoSort : String, CaseIterable {
    case one = "인기순"
    case two = "이름순"
    case three = "가격순"
}
