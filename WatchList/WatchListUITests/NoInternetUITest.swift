//
//  NoInternetUITest.swift
//  WatchListUITests
//
//  Created by Animesh Mishra on 5/12/21.
//

import XCTest

class NoInternetUITest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    /// - Experiment:Please test this scenario without internet
    /// - Note: Expected Result :  Alert should be presented with proper options
    func testNoInternet() {
        let app = XCUIApplication()
        app.launch()
        
        let elementsQuery = app.alerts["Error...!!!"].scrollViews.otherElements
        let retryButton = elementsQuery.buttons["Retry"]
        retryButton.tap()
        
        let okButton = elementsQuery.buttons["OK"]
        okButton.tap()
    }

}
