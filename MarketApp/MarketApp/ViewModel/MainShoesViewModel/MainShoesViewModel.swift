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
    @Published var shoesDetailData: ShoesDetailModel?
    
    var shoesCancellable: AnyCancellable?
    var shoesDetailCancellable: AnyCancellable?
    
    
    init() {
//        mainShoesRequest()
    }
    
    func toViewModel(_ list: ShoesModel) {
        self.shoesData = list
    }
    
    func toDetailViewModel(_ list: ShoesDetailModel) {
        self.shoesDetailData = list
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
    
    
    //MARK: - 신발  상세  데이터
    func mainDetailShoesRequest(transName: String) {
        if let cancellable = shoesDetailCancellable {
            cancellable.cancel()
        }
        
        let provider = MoyaProvider<MainDetailService>()
        shoesDetailCancellable = provider.requestPublisher(.mainShoesDetail(trans_name: transName))
            .compactMap { $0 }
            .sink(receiveCompletion: { result in
                switch result {
                case .failure(let error):
                    print(error.localizedDescription)
                case .finished:
                    print("신발 데이터")
                }
            }, receiveValue: { [weak self] model in
                let data = try? model.map(ShoesDetailModel.self)
                guard let shoesDetailData = data else { return }
                print("신발 상세 데이터 \(shoesDetailData)")
                self?.toDetailViewModel(shoesDetailData)
            })
        
    }
}
