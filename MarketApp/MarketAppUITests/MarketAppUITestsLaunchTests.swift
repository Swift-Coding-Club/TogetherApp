//
//  MarketAppUITestsLaunchTests.swift
//  MarketAppUITests
//
//  Created by 서원지 on 2023/02/19.
//

import XCTest

final class MarketAppUITestsLaunchTests: XCTestCase {
    
    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }
    
    override func setUpWithError() throws {
        continueAfterFailure = false
    }
    
    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()
        let launchView = app.otherElements["LaunchView"]
        XCTAssertTrue(launchView.waitForExistence(timeout: 3))
    }
}
