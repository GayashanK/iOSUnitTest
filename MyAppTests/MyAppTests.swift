//
//  MyAppTests.swift
//  MyAppTests
//
//  Created by Bear Cahill on 3/26/18.
//  Copyright © 2018 Bear Cahill. All rights reserved.
//

import XCTest
@testable import MyApp

class MyAppTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testExample() {
        let tc = TipCalc()
        XCTAssertEqual(tc.calcTip(amount: 128.51, tipPrec: 50.0), 64.25, accuracy: 0.01, "tip was wrong for 50%")
    }
    
    func testPerformanceExample() {
        self.measure {
        }
    }
    
}
