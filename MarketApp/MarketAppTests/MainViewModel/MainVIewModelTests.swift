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
        let mockData = [ShoesDetailData(shoesId: 1, brandName: "Nike", productName: "Nike Air Force 1 '07 Low White", transName: "나이키 에어포스 1 '07 로우 화이트", price: "128,000", productImg: ["https://kream-phinf.pstatic.net/MjAyMjA2MTVfMjYw/MDAxNjU1MjgzNjk2Mzk3.gh8n5rs7p-pWVqzIhNh7yj_KdyjLFBeJr9QbsDumoFEg.KdvPfvgBYmjm7MKKhcbIEQIP6FGeuof_GnmcDUgrvyAg.PNG/a_baa1ccea3726495badba419dfede63f9.png?type=m"])]
        
        viewModel.toViewModel(mockData)
        
        XCTAssertEqual(viewModel.shoesDetailData?.count, mockData.count)
        XCTAssertEqual(viewModel.shoesDetailData?.count, mockData.count)
        XCTAssertEqual(viewModel.shoesDetailData?.first?.shoesId, mockData.first?.shoesId)
        XCTAssertEqual(viewModel.shoesDetailData?.first?.brandName , mockData.first?.brandName)
        XCTAssertEqual(viewModel.shoesDetailData?.first?.productName, mockData.first?.productName)
        XCTAssertEqual(viewModel.shoesDetailData?.first?.transName, mockData.first?.transName)
        XCTAssertEqual(viewModel.shoesDetailData?.first?.productImg, mockData.first?.productImg)
        XCTAssertEqual(viewModel.shoesDetailData?.first?.price, mockData.first?.price)
        
    }
    
    
    func testToDetailViewModel() {
        let mockData = [ShoesDetailData(shoesId: 1, brandName: "Nike", productName: "Nike Air Force 1 '07 Low White", transName: "나이키 에어포스 1 '07 로우 화이트", price: "128,000", productImg: ["https://kream-phinf.pstatic.net/MjAyMTA5MDlfMTM2/MDAxNjMxMTY4NDgxNjYy.zbjY9wciksaYT7sUz-OdfVfMijT4zlN3ZrP1_FKTIkAg.q1tp-NTfS052i0hTqbYKf1mhtxZZBWEcEm9LUCfevhkg.PNG/a_bd87be02eddb460798690f5d082217c5.png?type=l", "https://kream-phinf.pstatic.net/MjAyMTA5MDlfMTE5/MDAxNjMxMTY4NDg0Mzk1.h6CHbDt3cSsoyGumXlzNmhTa8iNJvWcIzhzimNzNF2Ig.Gh0liKYzQEZ-r3l3gFAX0DBPT9bt2FuywdbiPK1-LJ0g.PNG/a_32465a09d3214e2e8cba85d1bc62ee04.png?type=l", "https://kream-phinf.pstatic.net/MjAyMTA5MDlfMTU5/MDAxNjMxMTY4NDg2Nzg3.Kf0RTLiVjQ2dxE8Z-ZgFPWDQGhJiQKt-LjVvrCo5NS4g.VPstVD7BiTciaEAwad02Z2i85fJvls4-zKUkaQHyElUg.PNG/a_dca56f9e768f4b028640d578f4703575.png?type=l"])]
        
        viewModel.toViewModel(mockData)
        
        XCTAssertEqual(viewModel.shoesDetailData?.count, mockData.count)
        XCTAssertEqual(viewModel.shoesDetailData?.count, mockData.count)
        XCTAssertEqual(viewModel.shoesDetailData?.first?.shoesId, mockData.first?.shoesId)
        XCTAssertEqual(viewModel.shoesDetailData?.first?.brandName , mockData.first?.brandName)
        XCTAssertEqual(viewModel.shoesDetailData?.first?.productName, mockData.first?.productName)
        XCTAssertEqual(viewModel.shoesDetailData?.first?.transName, mockData.first?.transName)
        XCTAssertEqual(viewModel.shoesDetailData?.first?.productImg, mockData.first?.productImg)
        XCTAssertEqual(viewModel.shoesDetailData?.first?.price, mockData.first?.price)
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
                let data = try? model.map(ShoesDetailData.self)
                XCTAssertNotNil(data, "shoesModel maping error")
                self.viewModel.toViewModel([data!])
                expectation.fulfill()
            })
    }
    
    func test_신발상세APIRequestTest() {
        let expectation = XCTestExpectation(description: "api 통신 테스트")
        viewModel.shoesCancellable = MoyaProvider<MainDetailService>().requestPublisher(.mainShoesDetail(trans_name: "나이키 에어포스 1 '07 로우 화이트"))
            .compactMap { $0 }
            .sink(receiveCompletion: { result in
                switch result {
                case .failure(let error):
                    XCTFail("api 통신 에러 : \(error.localizedDescription)")
                case .finished:
                    break
                }
            }, receiveValue: { model in
                let data = try? model.map(ShoesDetailData.self)
                XCTAssertNotNil(data, "shoesModel maping error")
                self.viewModel.toDetailViewModel([data!])
                expectation.fulfill()
            })
    }
}
