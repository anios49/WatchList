//
//  WatchListUtilsTests.swift
//  WatchListServicesTests
//
//  Created by Animesh Mishra on 4/12/21.
//

import XCTest
@testable import WatchListServices

class WatchListUtilsTests: XCTestCase {
    // MARK: Constants
    static let mockJsonFileName = "MockData"

    // MARK: Variables
    var watchListMock: WatchList!
    var entriesMock: [Entry] = []

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        watchListMock = try getData(fromJSON: WatchListUtilsTests.mockJsonFileName)
        entriesMock = watchListMock.entries ?? []
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        watchListMock = nil
    }

    /// Tesr Filtering the data, where programType is movie
    /// - Experiment:Testing filtering Entry list using Program Type
    /// - Note: Expected Result : Filtered list have only Movie program type in the list
    func testFilterProgramType() {
        // Put the code you want to measure the time of here.
        let expectation = self.expectation(description: "Filter Program should work fine")
        ///Filtering the data, where programType is movie
        let filterData = WatchListUtils().filterProgramType(withEnteries: entriesMock,
                                                            filterProgramType: ProgramType.movie.rawValue)
        
        for entry in filterData {
            ///if all filterdata programType is other than movie, then test should fail
            if (entry.programType?.rawValue != ProgramType.movie.rawValue) {
                XCTFail("Filter Program function is not working")
            }
        }
        expectation.fulfill()
        self.waitForExpectations(timeout: 5.0)
    }
    
    /// Test Filtering the data, where release year is equal or greater than filter year
    /// - Experiment:Testing filtering Entry list using Release year
    /// - Note: Expected Result : Filtered list have release years equal or greater than given year
    func testFilterWatchListYear() {
        // Put the code you want to measure the time of here.
        let expectation = self.expectation(description: "Filter Release Year should work fine")
        ///Filtering the data, where releaseYear should be equal or greater than 2012
        let filterData = WatchListUtils().filterWatchListYear(withEnteries: entriesMock,
                                                              filterReleaseYear: 2012)
        
        for entry in filterData {
            ///if all filterdata releaseYear is less than 2012, then test should fail
            if (entry.releaseYear < 2012) {
                XCTFail("Filter Release Year function is not working")
            }
        }
        expectation.fulfill()
        self.waitForExpectations(timeout: 5.0)
    }
    
    /// Sort WatchList AlphaNumeric
    /// - Experiment:Testing Sorting of Entry List
    /// - Note: Expected Result : Alpha Numeric Sorting should be done.
    func testSortWatchListAlphaNumeric() {
        // Put the code you want to measure the time of here.
        let expectation = self.expectation(description: "Alphanumeric Sorting should work fine")
        ///Sort the data, "AlphaNumeric"
        let filterData = WatchListUtils().sortWatchListAlphaNumeric(withEnteries: entriesMock)
        /// previous element Ascii Value
        var previousElementAsciiValue = 0 as UInt8
        
        filterData.map{$0.title}.forEach { word in
            if let currentElementAsciiValue = word.first?.asciiValue {
                /// if current Element Ascii value is greater than or equal to previous one then it is fine
                if (currentElementAsciiValue >= previousElementAsciiValue) {
                    previousElementAsciiValue = currentElementAsciiValue
                } else {
                    XCTFail("Alphanumeric Sorting function is not working")
                }
            }
            
        }
        
        expectation.fulfill()
        self.waitForExpectations(timeout: 5.0)
    }
    
    ///  Sort Entry list Alphanumeric and Filter the same, using filter release date and filter program type
    /// - Experiment:Testing Sorting and filtering of Entry List
    /// - Note: Expected Result : Alpha Numeric Sorted and filtered data
    func testsortAndFilterWatchList() {
        // Put the code you want to measure the time of here.
        let expectation = self.expectation(description: "Filter & Sort Oprations should work fine")
        ///Sort the data, "AlphaNumeric" and filter it using filter parameter
        let filterData = WatchListUtils().sortAndFilterWatchList(withEnteries: entriesMock,
                                                                 filterProgramType: ProgramType.series.rawValue,
                                                                 filterYear: 2010)
        // As per current mock data, filter data count shout be 45, if filterProgramType = series & filterYear = 2010
        let result = filterData.count
        if result == 45 {
            expectation.fulfill()
        } else {
            XCTFail("Filter & Sort Oprations are not working")
        }
        self.waitForExpectations(timeout: 5.0)
    }
}
