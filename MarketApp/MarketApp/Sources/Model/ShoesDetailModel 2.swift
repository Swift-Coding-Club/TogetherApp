//
//  ShoesDetailModel.swift
//  MarketApp
//
//  Created by 서원지 on 2023/03/13.
//

import Foundation

typealias ShoesDetailModel = [ShoesDetailData]

struct ShoesDetailData: Codable, Identifiable, Hashable {
    let id = UUID()
    let shoesId: Int?
    let brandName, productName, transName, price: String?
    let productImg: [String]

    enum CodingKeys: String, CodingKey {
        case shoesId = "id"
        case brandName = "brand_name"
        case productName = "product_name"
        case transName = "trans_name"
        case price
        case productImg = "product_img"
    }
}
