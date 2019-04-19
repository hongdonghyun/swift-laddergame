//
//  InputViewTests.swift
//  LadderGameTests
//
//  Created by Daheen Lee on 19/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import XCTest

class InputViewTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testInvalidEmptyNameArray() {
        let emtpyName = [String]()
        XCTAssertTrue(InputView.areNamesInvalidForGame(namesOfPlayer: emtpyName), "빈 배열은 invalid로 판별해야 함")
    }
    
    func testInvalidNamesWithBlank() {
        let namesWithBlank = ["kk", "gg", " ", "ff"]
        XCTAssertTrue(InputView.areNamesInvalidForGame(namesOfPlayer: namesWithBlank), "공백을 포함한 배열은 invalid")
    }
    
    func testInvalidNamesWithEmptyString() {
        let namesWithEmptyString = ["aa", "bb", "cc", "", "ddd", "ee"]
        XCTAssertTrue(InputView.areNamesInvalidForGame(namesOfPlayer: namesWithEmptyString), "empty string 포함한 배열은 invalid")
    }
    
    func testInvalidArrayWithOneName() {
        let oneName = ["one"]
        XCTAssertTrue(InputView.areNamesInvalidForGame(namesOfPlayer: oneName), "배열 크기가 2 이상이어야 함")
    }
    
    func testValidNames() {
        let validNames = ["minion", "mickey", "nick"]
        XCTAssertFalse(InputView.areNamesInvalidForGame(namesOfPlayer: validNames), "valid names")
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}