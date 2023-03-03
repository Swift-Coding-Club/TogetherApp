//
//  ShoeMockData.swift
//  MarketApp
//
//  Created by 서원지 on 2023/01/29.
//

import Foundation

typealias ShoesModel = [ShoeData]

struct ShoeData: Codable, Identifiable {
    let id = UUID()
    let shoesId: Int?
    let brandName: BrandName?
    let productName, transName: String?
    let image: String?
    let price: String?

    enum CodingKeys: String, CodingKey {
        case shoesId = "id"
        case brandName = "brand_name"
        case productName = "product_name"
        case transName = "trans_name"
        case image, price
    }
}

enum BrandName:  String, Codable , CaseIterable, CustomStringConvertible {
    case all = "전체"
    case nike = "Nike"
    case adidas = "Adidas"
    case converse = "Converse"
    case jordan = "Jordan"
    case miharaYasuhiro = "Mihara Yasuhiro"
    case newBalance = "New Balance"
    
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
}
