//
//  InfoViewModel.swift
//  MarketApp
//
//  Created by 홍태희 on 2023/02/14.
//

import SwiftUI

//MARK : 커뮤니티
let dateformat: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "YYYY년 M월 d일"
    return formatter
}()


//MARK : 상단탭바
enum DetailTapInfo : String, CaseIterable {
    case info = "상세정보"
    case community = "커뮤니티"
}

