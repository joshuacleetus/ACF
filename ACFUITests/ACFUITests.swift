//
//  ACFUITests.swift
//  ACFUITests
//
//  Created by Macbook Air on 8/12/19.
//  Copyright © 2019 Joshua Cleetus. All rights reserved.
//

import XCTest

class ACFUITests: XCTestCase {

    var app: XCUIApplication!

    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testAppShopButton() {
        
                                app.scrollViews.firstMatch.buttons.firstMatch.tap()
    }

}
