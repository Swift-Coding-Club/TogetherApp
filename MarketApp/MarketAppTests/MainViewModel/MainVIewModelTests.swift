//
//  MainVIewModelTests.swift
//  MarketAppTests
//
//  Created by 서원지 on 2023/02/21.
//

import XCTest
import Combine
import Moya
@testable import MarketApp

final class MainVIewModelTests: XCTestCase {
    
    var viewModel: MainShoesViewModel!
    
    
    override func setUp() {
        super.setUp()
        viewModel = MainShoesViewModel()
    }
    
    override func tearDown() {
        viewModel = nil
        super.tearDown()
    }
    
    
    func testToViewModel() {
        let mockData = [ShoeResponse(code: "200", message: nil, data: [ShoeData(shoesId: 1, brandName: .adidas, productName: "product", transName: nil, image: nil, price: nil)])]
        
        viewModel.toViewModel(mockData)
        
        XCTAssertEqual(viewModel.shoesData?.count, mockData.count)
        XCTAssertEqual(viewModel.shoesData?.first?.data?.count, mockData.first?.data?.count)
        XCTAssertEqual(viewModel.shoesData?.first?.data?.first?.shoesId, mockData.first?.data?.first?.shoesId)
        XCTAssertEqual(viewModel.shoesData?.first?.data?.first?.brandName, mockData.first?.data?.first?.brandName)
        XCTAssertEqual(viewModel.shoesData?.first?.data?.first?.productName, mockData.first?.data?.first?.productName)
    }
    
    
    
    func test_신발APIRequestTest() {
        let expectation = XCTestExpectation(description: "api 통신 테스트")
        viewModel.shoesCancelable = MoyaProvider<MainShoesService>().requestPublisher(.mainShoesData)
            .compactMap { $0 }
            .sink(receiveCompletion: { result in
                switch result {
                case .failure(let error):
                    XCTFail("api 통신 에러 : \(error.localizedDescription)")
                case .finished:
                    break
                }
            }, receiveValue: { model in
                let data = try? model.map(ShoesModel.self)
                XCTAssertNotNil(data, "shoesModel maping error")
                self.viewModel.toViewModel(data!)
                expectation.fulfill()
            })
    }
}
