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
}

extension MainShoesService: TargetType {
    var baseURL: URL {
    return URL(string: "https://tinyurl.com")!
    }
    
    var path: String {
        switch self {
        case .mainShoesData:
            return AffinityAPI.MainShoes
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .mainShoesData:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .mainShoesData:
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
        }
    }
}
