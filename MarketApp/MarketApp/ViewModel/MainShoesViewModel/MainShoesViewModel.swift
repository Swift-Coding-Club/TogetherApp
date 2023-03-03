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
    var shoesCancellable: AnyCancellable?
    
    init() {
//        mainShoesRequest()
    }
    
    func toViewModel(_ list: ShoesModel) {
        self.shoesData = list
    }
    
    
    //MARK: - 신발 전체 데이터
    func mainShoesRequest() {
        if let cancellable = shoesCancellable {
            cancellable.cancel()
        }
        let provider = MoyaProvider<MainShoesService>()
        shoesCancellable = provider.requestPublisher(.mainShoesData)
            .compactMap { $0 }
            .sink(receiveCompletion: { result in
                switch result {
                case .failure(let error):
                    print(error.localizedDescription)
                case .finished:
                    print("신발 데이터")
                }
            }, receiveValue: { model in
                let data = try? model.map(ShoesModel.self)
                guard let shoesData = data else { return }
                print("신발 데이터 \(shoesData)")
                self.toViewModel(shoesData)
            })
    }
}
