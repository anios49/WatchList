//
//  WatchListTests.swift
//  WatchListTests
//
//  Created by Animesh Mishra on 2/12/21.
//

import XCTest
import WatchListServices
@testable import WatchList

class ProgramOptionsViewModelTests: XCTestCase {
    // MARK: Variables
    var programOptionsViewModel = ProgramOptionsViewModel()
    var watchListMock: WatchList!
    static let mockJsonFileName = "MockData"

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        watchListMock = try getData(fromJSON: ProgramOptionsViewModelTests.mockJsonFileName)

    }
    
    /// - Experiment:test RequestAPI
    /// - Note: Expected Result :  NineNewsPointViewModel's assests property should have value.
    /// - Note: Response wait time should be 5 seconds.
    func testRequestAPI() {
        let expectation = self.expectation(description: "RequestAPI is working fine")
        XCTAssertEqual(programOptionsViewModel.watchListEntries.count, 0)
        programOptionsViewModel.requestAPI()
        let result = XCTWaiter.wait(for: [expectation], timeout: 5.0)
        if result == XCTWaiter.Result.timedOut {
            XCTAssertNotNil(programOptionsViewModel.watchListEntries)
            expectation.fulfill()
        } else {
            XCTFail("Delay interrupted")
        }
    }
    
    /// Test ProvideDataForMovies function
    /// - Experiment:Testing ProvideDataForMovies function, which should sort the data, "AlphaNumeric", and filter it using filter parameter
    /// - Note: Expected Result : filtered movies data
    func testProvideDataForMovies() {
        let expectation = self.expectation(description: "ProvideDataForMovies function should work fine")
        ///Sort the data, "AlphaNumeric"
        
        /// FIlter Movie data
        programOptionsViewModel.watchListEntries = watchListMock.entries ?? []
        let filterData = programOptionsViewModel.provideDataForMovies()
        
        if (filterData.count == 0) {
            XCTFail("ProvideDataForMovies function is not working")
        }
        
        // As per current mock data, filter data count shout be 45, if filterProgramType = movie & filterYear = 2010
        for entry in filterData {
            ///if all filterdata programType is other than movie, then test should fail
            if (entry.programType?.rawValue != ProgramType.movie.rawValue) {
                XCTFail("ProvideDataForMovies function is not working")
            }
        }
        expectation.fulfill()
        self.waitForExpectations(timeout: 5.0)
    }
    
    /// Test ProvideDataForSeries function
    /// - Experiment:Testing ProvideDataForMovies function, which should sort the data, "AlphaNumeric", and filter it using filter parameter
    /// - Note: Expected Result : filtered series data
    func testProvideDataForSeries() {
        let expectation = self.expectation(description: "ProvideDataForSeries function should work fine")
        ///Sort the data, "AlphaNumeric"
        
        /// FIlter Movie data
        programOptionsViewModel.watchListEntries = watchListMock.entries ?? []
        let filterData = programOptionsViewModel.provideDataForSeries()
        
        if (filterData.count == 0) {
            XCTFail("ProvideDataForSeries function is not working")
        }
        
        // As per current mock data, filter data count shout be 45, if filterProgramType = movie & filterYear = 2010
        for entry in filterData {
            ///if all filterdata programType is other than movie, then test should fail
            if (entry.programType?.rawValue != ProgramType.series.rawValue) {
                XCTFail("ProvideDataForSeries function is not working")
            }
        }
        expectation.fulfill()
        self.waitForExpectations(timeout: 5.0)
    }
}
