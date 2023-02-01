//
//  ShoeMockData.swift
//  MarketApp
//
//  Created by 서원지 on 2023/01/29.
//

import Foundation

typealias shoesData = [ShoeMockData]

struct ShoeMockData: Codable {
    let brandName: BrandName?
    let productName, transName: String?
    let image: String?
    let price: String?

    enum CodingKeys: String, CodingKey {
        case brandName = "brand_name"
        case productName = "product_name"
        case transName = "trans_name"
        case image, price
    }
}

enum BrandName: String, Codable {
    case adidas = "Adidas"
    case converse = "Converse"
    case jordan = "Jordan"
    case miharaYasuhiro = "Mihara Yasuhiro"
    case newBalance = "New Balance"
    case nike = "Nike"
}
