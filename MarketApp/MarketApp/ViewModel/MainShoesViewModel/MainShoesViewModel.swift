//
//  MainShoesViewModel.swift
//  MarketApp
//
//  Created by 서원지 on 2023/01/29.
//

import Foundation
import Combine

class ShoeNetwork : ObservableObject {
    @Published var shoe : [ShoeData] = []
    var finished : AnyCancellable?
    
    func networking() {
        guard let url = URL(string: "https://tinyurl.com/2nkhmkm6") else { return }
        
        finished = URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos: .background))
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
                    self?.shoe = shoeInfo
                    self?.finished?.cancel()
                }
            )
    }
}
