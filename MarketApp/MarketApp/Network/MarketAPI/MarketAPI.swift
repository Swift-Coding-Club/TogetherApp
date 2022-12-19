//
//  MarketAPI.swift
//  MarketApp
//
//  Created by 서원지 on 2022/12/19.
//

import Foundation
import Combine
import Alamofire

enum MarketAPI {
    static let agent = NetworkAgent()
    //MARK: - base URL

    static var baseURL: URL {
        return URL(string: "")!
    }
    //MARK: - API header 필수 값
    static func headers() -> HTTPHeaders {
        return [
            
            ]
    }
}

extension MarketAPI {
    static func get<T: Decodable>(_ url: URL) -> AnyPublisher<T, APIError> {
        print("url : \(url), params : ")
        let request = AF.request(url, method: .get, encoding: URLEncoding.default, headers: headers())
        
        return agent.run(request)
            .map(\.value)
            .eraseToAnyPublisher()
    }
    
    static func get<T: Decodable, P: Encodable>(_ url: URL, parameters: P) -> AnyPublisher<T, APIError> {
        print("url : \(url), params : \(parameters)")
        let request = AF.request(url, method: .get, parameters: parameters, encoder: URLEncodedFormParameterEncoder(destination: .queryString), headers: headers())
        
        return agent.run(request)
            .map(\.value)
            .eraseToAnyPublisher()
    }
    
    static func post<T: Decodable>(_ url: URL) -> AnyPublisher<T, APIError> {
        print("url : \(url), params : ")
        let request = AF.request(url, method: .post, encoding: URLEncoding.default, headers: headers())
        
        return agent.run(request)
            .map(\.value)
            .eraseToAnyPublisher()
    }
    
    static func post<T: Decodable>(_ url: URL, parameters: [String: String]) -> AnyPublisher<T, APIError> {
        print("url : \(url), params : \(parameters)")
        let request = AF.request(url, method: .post, parameters: parameters, encoder: URLEncodedFormParameterEncoder(destination: .httpBody), headers: headers())
        return agent.run(request)
        .map(\.value)
        .eraseToAnyPublisher()
    }
    
    static func post<T: Decodable, P: Encodable>(_ url: URL, parameters: P) -> AnyPublisher<T, APIError> {
        print("url : \(url), params : \(parameters)")
        let request = AF.request(url, method: .post, parameters: parameters, encoder: URLEncodedFormParameterEncoder(destination: .httpBody), headers: headers())
        return agent.run(request)
        .map(\.value)
        .eraseToAnyPublisher()
    }
}
