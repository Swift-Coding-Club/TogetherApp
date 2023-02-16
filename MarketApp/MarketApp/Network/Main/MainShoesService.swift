//
//  MainShoesService.swift
//  MarketApp
//
//  Created by 서원지 on 2023/02/13.
//

import Foundation
import Combine

class ShoeNetwork : ObservableObject {
    @Published var shoe : [ShoeData] = []
    var finished = Set<AnyCancellable>()
    
    func networking() {
        guard let url = URL(string: "https://c11.kr/CreamMainShoes") else { return }
        
        let subscribe = URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data) //If your closure can throw an error, use Combine’s tryMap(_:) operator instead.
            .decode(type: ShoeData.self, decoder: JSONDecoder())
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
                    self?.shoe.append(shoeInfo)
                }
            )
            .store(in: &finished)
    }
}
