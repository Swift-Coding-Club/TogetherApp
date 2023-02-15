//
//  MainShoesViewModel.swift
//  MarketApp
//
//  Created by 서원지 on 2023/01/29.
//

import Foundation
import Combine
import Moya

class MainShoesViewModel: ObservableObject {
    
    @Published var shoesData: ShoesModel?
    var shoesCancelable: AnyCancellable?
    
    init() {
        mainShoesRequest()
    }
    
    func toViewModel(_ list: ShoesModel) {
        self.shoesData = list
    }
    
    func mainShoesRequest() {
        if let cancelable = shoesCancelable {
            cancelable.cancel()
        }
        let provider = MoyaProvider<MainShoesService>()
        shoesCancelable = provider.requestPublisher(.mainShoesData)
            .compactMap { $0 }
            .sink(receiveCompletion: { result in
                switch result {
                case .failure(let error):
                    print(error.localizedDescription)
                case .finished:
                    break
                }
            }, receiveValue: { model in
                let data = try? model.map(ShoesModel.self)
                guard let shoesData = data else { return }
                print("신발 데이터 \(shoesData)")
                self.toViewModel(shoesData)
            })
        
    }
}
