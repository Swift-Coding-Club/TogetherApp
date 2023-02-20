//
//  LoginViewModelTest.swift
//  MarketAppTests
//
//  Created by 서원지 on 2023/02/20.
//

import XCTest
import FirebaseAuth
import Firebase
import FirebaseDatabase
import AuthenticationServices

@testable import MarketApp

class SignUPViewModelTests: XCTestCase {
    
    var signUpViewModel: SignUPViewModel!
    var credential : ASAuthorizationAppleIDCredential!
    
    override func setUp() {
        super.setUp()
        signUpViewModel = SignUPViewModel()
    }
    
    override func tearDown() {
        super.tearDown()
        signUpViewModel = nil
        credential = nil
    }
    
    func test_회원가입() {
        let email = "test@example.com"
        let password = "password1"
        let nickName = ""
        let expectation = XCTestExpectation(description: "register_failure")
        
        signUpViewModel.register(withEmail: email, password: password, nickName: nickName)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            let user = Auth.auth().currentUser
            XCTAssertNil(user)
            XCTAssertFalse(self.signUpViewModel.loginStatus)
            XCTAssertTrue(self.signUpViewModel.userSession != nil, "회원가입 실패")
            expectation.fulfill()
        }
    }
    
    func test_유저닉네임저장() {
        let nickname = "testuser"
        let expectation = XCTestExpectation(description: "닉네임 저장")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            self.signUpViewModel.saveUserInformation(nickName: nickname)
            XCTAssertEqual(self.signUpViewModel.userSession?.displayName, nickname)
            expectation.fulfill()
        }
    }
    
    
    
    func test_로그인() {
        let email = "test@example.com"
        let password = "password1"
        let expectation = XCTestExpectation(description: "로그인 성공")
        
        signUpViewModel.login(withEmail: email, password: password)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            let user = Auth.auth().currentUser
            XCTAssertNil(user)
            XCTAssertFalse(self.signUpViewModel.loginStatus)
            XCTAssertTrue(self.signUpViewModel.userSession != nil, "로그인 실패")
            expectation.fulfill()
        }
    }
    
    func test_로그아웃() {
        let expectation = XCTestExpectation(description: "로그아웃 성공")
        
        signUpViewModel.signOut()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            let user = Auth.auth().currentUser
            XCTAssertNil(user)
            XCTAssertFalse(self.signUpViewModel.loginStatus)
            XCTAssertTrue(self.signUpViewModel.userSession == nil, "로그아웃 실패")
            expectation.fulfill()
        }
    }
    
    func test_회원탈퇴() {
        let expectation = XCTestExpectation(description: "회원탈퇴 성공")
        
        signUpViewModel.withdrawUser()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
            XCTAssertTrue(self.signUpViewModel.deleteUser)
            XCTAssertNil(self.signUpViewModel.userSession)
            XCTAssertFalse(self.signUpViewModel.loginStatus)
            expectation.fulfill()
        }
    }
    
    func test_구글로그인() {
        let expectation = XCTestExpectation(description: "구글 로그인 성공")
        
        signUpViewModel.googleLogin()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 6) {
            let user = Auth.auth().currentUser
            XCTAssertNil(user)
            XCTAssertFalse(self.signUpViewModel.loginStatus)
            XCTAssertTrue(self.signUpViewModel.userSession != nil, "로그인 실패")
            expectation.fulfill()
        }
    }
    
    func test_apple로그인() throws {
        let expectation = XCTestExpectation(description: "애플 로그인 성공")
       
        if let credential = credential {
            signUpViewModel.appleLogin(credential: credential)
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 7) {
            let user = Auth.auth().currentUser
            XCTAssertNil(user)
            XCTAssertFalse(self.signUpViewModel.loginStatus)
            XCTAssertTrue(self.signUpViewModel.userSession != nil, "로그인 실패")
            expectation.fulfill()
        }
    }
}
