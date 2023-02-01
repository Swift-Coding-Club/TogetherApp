//
//  MainShoesViewModel.swift
//  MarketApp
//
//  Created by 서원지 on 2023/01/29.
//

import Foundation
import Combine

class MainShoesViewModel: ObservableObject {
    
    @Published var shoesData: shoesData?
    var shoesCancelable: AnyCancellable?
    
    init() {
        mainShoesRequest()
    }
    
    
    func mainShoesRequest() {
        if let cancelable = shoesCancelable {
            cancelable.cancel()
        }
        shoesCancelable = MarketAPI.getMainShoes()
            .compactMap{ $0 }
            .sink(receiveCompletion: { error in
                print(error)
            }, receiveValue: { model  in
                self.shoesData = model
                print(model)
            })
    }
}
