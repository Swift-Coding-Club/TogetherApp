//
//  MarketAppTests.swift
//  MarketAppTests
//
//  Created by 서원지 on 2023/02/19.
//

import XCTest
@testable import MarketApp

class ProfileViewModelTests: XCTestCase {
    
    var sut: ProfileViewModel!
    
    override func setUp() {
        super.setUp()
        sut = ProfileViewModel()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func test_프로필가져오기() {
        // Given
        let expectation = XCTestExpectation(description: "User information fetched")
        
        // When
        sut.getUserInformation()
        
        // Then
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            // You can increase or decrease the waiting time according to your requirement.
            // Here, we are waiting for 5 seconds before performing the assertions.
            // You may adjust the time interval as per your requirement.
            XCTAssertNotNil(self.sut.userEmail)
            XCTAssertNotNil(self.sut.userNickName)
            XCTAssertNotNil(self.sut.userImageURL)
            expectation.fulfill()
        }
    }
    
    func test_이미지저장() {
        // Given
        let expectation = XCTestExpectation(description: "Profile image saved")
        let testImage = UIImage(named: "TestImage")
        
        // When
        if let testImage = testImage {
            sut.saveProfileImage(testImage)
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
            // You can increase or decrease the waiting time according to your requirement.
            // Here, we are waiting for 5 seconds before performing the assertions.
            // You may adjust the time interval as per your requirement.
            XCTAssertNotNil(self.sut.userImage)
            expectation.fulfill()
        }
    }
    
    func test_프로필다운로드() {
        // Given
        let expectation = XCTestExpectation(description: "Profile image downloaded")
        sut.userImageURL = URL(string: "https://www.example.com/testImage.png")
        
        // When
        sut.downloadProfileImage()
        
        // Then
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 15) {
            // You can increase or decrease the waiting time according to your requirement.
            // Here, we are waiting for 5 seconds before performing the assertions.
            // You may adjust the time interval as per your requirement.
            XCTAssertNotNil(self.sut.userImage)
            expectation.fulfill()
        }
    }
    
    func test_프로필이미지가져오기() {
        // Given
        let expectation = XCTestExpectation(description: "Profile image fetched")
        sut.userImageURL = URL(string: "https://www.example.com/testImage.png")
        
        // When
        sut.getProfileImage()
        DispatchQueue.main.asyncAfter(deadline: .now() + 20) {
            // You can increase or decrease the waiting time according to your requirement.
            // Here, we are waiting for 5 seconds before performing the assertions.
            // You may adjust the time interval as per your requirement.
            XCTAssertNotNil(self.sut.userImage)
            expectation.fulfill()
        }
        
    }
}
