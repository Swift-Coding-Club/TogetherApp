//
//  Product.swift
//  MarketApp
//
//  Created by Keith on 2022/11/04.
//

import Foundation
import SwiftUI

struct Product: Hashable, Codable, Identifiable{
    var id: Int
    var productName: String
    var brandName: String
    var productPrice: Int
    var description: String
    var state: Bool
    var isFavorite: Bool
    
    var category: Category
    
    enum Category: String, CaseIterable, Codable{
        case shoes = "Shoes"
        case top = "Top"
        case shirt = "Shirt"
    }
    
    private var imageName : String
    var productImage: Image {
        Image(imageName)
    }
    
}

