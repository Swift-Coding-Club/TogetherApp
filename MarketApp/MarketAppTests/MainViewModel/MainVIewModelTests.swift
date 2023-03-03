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
        let mockData = [ShoeData(shoesId: 1, brandName: .adidas, productName: "Nike Air Force 1 '07 Low White", transName: "나이키 에어포스 1 '07 로우 화이트", image: "https://kream-phinf.pstatic.net/MjAyMjA2MTVfMjYw/MDAxNjU1MjgzNjk2Mzk3.gh8n5rs7p-pWVqzIhNh7yj_KdyjLFBeJr9QbsDumoFEg.KdvPfvgBYmjm7MKKhcbIEQIP6FGeuof_GnmcDUgrvyAg.PNG/a_baa1ccea3726495badba419dfede63f9.png?type=m", price: "128,000")]
        
        viewModel.toViewModel(mockData)
        
        XCTAssertEqual(viewModel.shoesData?.count, mockData.count)
        XCTAssertEqual(viewModel.shoesData?.count, mockData.count)
        XCTAssertEqual(viewModel.shoesData?.first?.shoesId, mockData.first?.shoesId)
        XCTAssertEqual(viewModel.shoesData?.first?.brandName , mockData.first?.brandName)
        XCTAssertEqual(viewModel.shoesData?.first?.productName, mockData.first?.productName)
        XCTAssertEqual(viewModel.shoesData?.first?.transName, mockData.first?.transName)
        XCTAssertEqual(viewModel.shoesData?.first?.image, mockData.first?.image)
        XCTAssertEqual(viewModel.shoesData?.first?.price, mockData.first?.price)
        
    }
    
    
    
    func test_신발APIRequestTest() {
        let expectation = XCTestExpectation(description: "api 통신 테스트")
        viewModel.shoesCancellable = MoyaProvider<MainShoesService>().requestPublisher(.mainShoesData)
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
