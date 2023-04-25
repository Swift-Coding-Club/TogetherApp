//
//  MainDetailService.swift
//  MarketApp
//
//  Created by 서원지 on 2023/03/13.
//

import Moya
import Foundation

enum MainDetailService {
    case mainShoesDetail(trans_name: String)
}

extension MainDetailService: TargetType {
    var baseURL: URL {
        return URL(string: "https://640de3d61a18a5db83827295.mockapi.io")!
    }
    
    var path: String {
        switch self {
        case .mainShoesDetail:
            return AffinityAPI.MainDetailShoes
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .mainShoesDetail(let trans_name):
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .mainShoesDetail(let trans_name):
            return .requestParameters(parameters: ["trans_name" : trans_name], encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .mainShoesDetail:
            return [
                "Accept": "application/json",
                "Content-Type": "application/json"
            ]
        }
    }
}

