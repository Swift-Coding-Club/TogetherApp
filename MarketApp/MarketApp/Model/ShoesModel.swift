//
//  ShoeMockData.swift
//  MarketApp
//
//  Created by 서원지 on 2023/01/29.
//

import Foundation

struct ShoeResponse: Codable {
    let data: [ShoeData]?
}

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

enum BrandName: String, Codable , CaseIterable, CustomStringConvertible {
    case adidas = "Adidas"
    case converse = "Converse"
    case jordan = "Jordan"
    case miharaYasuhiro = "Mihara Yasuhiro"
    case newBalance = "New Balance"
    case nike = "Nike"
    
    var description: String {
        switch self {
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
        case .nike:
            return "나이키"
        }
    }
}
