//
//  ACFTests.swift
//  ACFTests
//
//  Created by Macbook Air on 8/12/19.
//  Copyright © 2019 Joshua Cleetus. All rights reserved.
//

import XCTest
@testable import ACF
@testable import Alamofire

class ACFTests: XCTestCase {
    
    var apiService:ProductAPIService!
    
    override func setUp() {
        super.setUp()
        apiService = ProductAPIService()
    }

    override func tearDown() {
        apiService = nil
        super.tearDown()
    }
    
    // Asynchronous test: success fast, failure slow
    func testValidCallToiTunesGetsHTTPStatusCode200() {
        // given
        let route = ProductAPIRouter.product
        // 1
        let promise = expectation(description: "Status code: 200")
        
        // when
        Alamofire.request(route).responseJSON { (response) in
            // then
            if let statusCode = response.response?.statusCode, statusCode == 200 {
                promise.fulfill()
            } else {
                XCTFail("Status code not 200")
            }
        }
        // 3
        wait(for: [promise], timeout: 10)
    }
    
    func testValidCallToServerGetsProducts() {
        // given
        let route = ProductAPIRouter.product
        // 1
        let promise = expectation(description: "Products fetched successfully from the server!")
        
        // when
        apiService.getData(route: route) { (data) in
            let decoder = JSONDecoder()
            // then
            if let data = data, let results = try? decoder.decode([Product].self, from: data) {
                if !results.isEmpty {
                    promise.fulfill()
                } else {
                    XCTFail("No data found!")
                }
            } else {
                XCTFail("No data found!")
            }
        }
        // 3
        wait(for: [promise], timeout: 10)
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
