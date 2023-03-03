//
//  MainShoesService.swift
//  MarketApp
//
//  Created by 서원지 on 2023/02/13.
//

import Foundation
import Moya

enum MainShoesService {
    case mainShoesData
    case nikeShoesData
}

extension MainShoesService: TargetType {
    var baseURL: URL {
        return URL(string: "https://run.mocky.io")!
    }
    
    var path: String {
        switch self {
        case .mainShoesData:
            return AffinityAPI.MainShoes
        case .nikeShoesData:
            return AffinityAPI.nikeShoes
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .mainShoesData:
            return .get
        case .nikeShoesData:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .mainShoesData:
            return .requestPlain
        case .nikeShoesData:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .mainShoesData:
            return [
                "Accept": "application/json",
                "Content-Type": "application/json"
            ]
        case .nikeShoesData:
            return [
                "Accept": "application/json",
                "Content-Type": "application/json"
            ]
        }
    }
}
