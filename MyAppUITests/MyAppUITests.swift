//
//  MyAppUITests.swift
//  MyAppUITests
//
//  Created by Kasun Gayashan on 05.02.22.
//  Copyright © 2022 Bear Cahill. All rights reserved.
//

import XCTest

class MyAppUITests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    override func tearDownWithError() throws {
    }

    func testCalculator() throws {
        let app = XCUIApplication()
        app.launch()
        print(debugDescription)
        let amountTF = app.textFields["amountTF"]
        let calcBtn = app.buttons["calcBtn"]
        let tipLbl = app.staticTexts["tipLbl"]
        amountTF.tap()
        amountTF.typeText("56.3")
        calcBtn.tap()
        XCTAssertEqual(tipLbl.label.description, "Tip - 28.15")
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
