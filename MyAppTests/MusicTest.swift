//
//  MusicTest.swift
//  MyAppTests
//
//  Created by Kasun Gayashan on 05.02.22.
//  Copyright © 2022 Bear Cahill. All rights reserved.
//

import XCTest
@testable import MyApp

class MusicTest: XCTestCase {

    override func setUpWithError() throws {
    }

    override func tearDownWithError() throws {
    }

    func testParseJSON() throws {
        let music = MusicModel()
        let bundle = Bundle(for: type(of: self))
        if let path = bundle.path(forResource: "Music", ofType: "json") {
            if let data = try? Data.init(contentsOf: URL(fileURLWithPath: path)) {
                let result = music.parseJSON(data: data)
                XCTAssertNotNil(result, "should not be nil")
                XCTAssertGreaterThan(result!.count, 0, "sould have values")
            } else {
                XCTFail()
            }
        } else {
            XCTFail()
        }
    }
    
    func testRefresh() throws {
        let music = MockMusicModel()
        music.refresh()
        XCTAssertNotNil(music.cache, "cache should not be nil")
        XCTAssertNotNil(music.fetchDate, "fetchdate should not be nil")
    }
    
    func testFetch() {
        let exp = expectation(description: "Fetch Music Data")
        let music = MusicModel()
        music.fetchMusic(completion: { items, error in
            XCTAssertNotNil(items, "items should not be nil")
            XCTAssertFalse(items?.isEmpty ?? false, "items should not be empty")
            exp.fulfill()
        })
        waitForExpectations(timeout: 10.0) { error in
            print(error?.localizedDescription ?? "")
        }
    }

    func testPerformanceExample() throws {
        self.measure {
            let exp = expectation(description: "Fetch Music Data")
            let music = MusicModel()
            music.fetchMusic { items, error in
                exp.fulfill()
            }
            waitForExpectations(timeout: 10.0) { error in
                print(error?.localizedDescription ?? "")
            }
        }
    }

}

