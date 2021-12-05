//
//  WatchListUITests.swift
//  WatchListUITests
//
//  Created by Animesh Mishra on 2/12/21.
//

import XCTest

class WatchListUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
    
    func testUserFlowForMovie() {
        /// Basic setup
        let app = XCUIApplication()
        let firstCell = XCUIApplication().collectionViews.cells.firstMatch
        XCUIDevice.shared.orientation = .portrait
        let backButton = app.navigationBars["Movie List"].buttons["Program Options"]
        /// Expectation
        let exp = expectation(description: "Movie Userflow should work properly within time")
        let result = XCTWaiter.wait(for: [exp], timeout: 5.0)
        ///App launch
        app.launch()
        /// select movie option
        app.staticTexts["Movies"].tap()
        /// Share button test
        firstCell.buttons["shareButton"].tap()
        app.navigationBars["UIActivityContentView"].buttons["Close"].tap()
        /// scroll the collection view
        firstCell.children(matching: .other).element.swipeUp()
        /// Back button navigation
        backButton.tap()
        ///Test Result
        if result == XCTWaiter.Result.timedOut {
            exp.fulfill()
        } else {
            XCTFail("Delay interrupted")
        }
    }
    
    func testUserFlowForSeries() {
        /// Basic setup
        let app = XCUIApplication()
        let firstCell = XCUIApplication().collectionViews.cells.firstMatch
        XCUIDevice.shared.orientation = .portrait
        let backButton = app.navigationBars["Series List"].buttons["Program Options"]
        /// Expectation
        let exp = expectation(description: "Series Userflow should work properly within time")
        let result = XCTWaiter.wait(for: [exp], timeout: 5.0)
        ///App launch
        app.launch()
        /// select Series option
        app.staticTexts["Series"].tap()
        /// Share button test
        firstCell.buttons["shareButton"].tap()
        app.navigationBars["UIActivityContentView"].buttons["Close"].tap()
        /// scroll the collection view
        firstCell.children(matching: .other).element.swipeUp()
        /// Back button navigation
        backButton.tap()
        ///Test Result
        if result == XCTWaiter.Result.timedOut {
            exp.fulfill()
        } else {
            XCTFail("Delay interrupted")
        }
    }
    
    /// - Experiment:Test Collection View Items
    /// - Note: Expected Result :  should be able to tap all the present tile on screen
    func testCollectionViewItems() throws {
        /// Basic setup
        let app = XCUIApplication()
        let collectionViewsCells = app.collectionViews.cells
        XCUIDevice.shared.orientation = .portrait
        ///App launch
        app.launch()
        /// select movie option
        app.staticTexts["Movies"].tap()
        /// collection view cells count be greater than 0
        if collectionViewsCells.count > 0 {
            /// Expectation
            let exp = expectation(description: "Wait for collection view cells")
            /// Iterate collection view cell present on screen
            for i in stride(from: 0, to: collectionViewsCells.count , by: 1) {
                // Grab the first cell and verify that it exists and tap it
                let collectionViewsCell = collectionViewsCells.element(boundBy: i)
                XCTAssertTrue(collectionViewsCell.exists, "The \(i) cell is in place on the Collection View")
                collectionViewsCell.tap()
                
                if i == (collectionViewsCells.count - 1) {
                    exp.fulfill()
                }
            }
            waitForExpectations(timeout: 5, handler: nil)
            XCTAssertTrue(true, "Finished validating the collection view cells")
        } else {
            XCTAssert(false, "Was not able to find any collection view cells")
        }
    }
}
