//
//  MainShoesViewModel.swift
//  MarketApp
//
//  Created by 서원지 on 2023/01/29.
//

import Foundation
import Combine

class ShoeNetwork : ObservableObject {
    @Published var shoeInfo : [ShoeData] = []
    
    var finished : AnyCancellable?
    
    func networking() {
        guard let url = URL(string: "https://run.mocky.io/v3/a238cfb6-d2fa-4884-b42c-a796abe580a1") else { return }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        
        finished = URLSession.shared.dataTaskPublisher(for: urlRequest)
            .tryMap { data, response -> Data in
                guard let response = response as? HTTPURLResponse,
                      response.statusCode >= 200 && response.statusCode <= 299 else {
                        throw URLError(.badServerResponse)
                      }
                return data
            }
            .decode(type: [ShoeData].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(
                receiveCompletion: { completion in
                    switch completion {
                    case .finished :
                        print("SUCCESS")
                    case .failure(let error) :
                        print("ERROR : \(error.localizedDescription)")
                    }
                },
                receiveValue: { [weak self] shoeInfo in
                    self?.shoeInfo = shoeInfo
                    self?.finished?.cancel()
                }
            )
    }
}
