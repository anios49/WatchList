//
//  MovieListViewModelTests.swift
//  WatchListTests
//
//  Created by Animesh Mishra on 5/12/21.
//

import XCTest
import WatchListServices
@testable import WatchList

class MovieListViewModelTests: XCTestCase {
    var programOptionsViewModel = ProgramOptionsViewModel()
    var watchListMock: WatchList!
    static let mockJsonFileName = "MockData"
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        watchListMock = try getData(fromJSON: ProgramOptionsViewModelTests.mockJsonFileName)
        programOptionsViewModel.watchListEntries = watchListMock.entries ?? []
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        watchListMock = nil
    }
    
    /// Test CellForItemAtIndexPathForSection function
    /// - Experiment:Testing CellForItemAtIndexPathForSection function, ProgramDataSource dataSource should not be nil
    /// - Note: Expected Result : dataSource should not be nil
    func testCellForItemAtIndexPathForSection() {
        let expectation = self.expectation(description: "ProgramDataSource should not be nil")
        /// set the MovieListViewModel
        let movieListViewModel = MovieListViewModel(withMovieList: programOptionsViewModel.provideDataForMovies())
        /// data source for movie view collection cell
        let dataSource = movieListViewModel.cellForItemAtIndexPathForSection(row: 0)
        XCTAssertNotNil(dataSource?.titleLabelText)
        XCTAssertNotNil(dataSource?.titleDescriptionLabelText)
        XCTAssertNotNil(dataSource?.releaseYearLabelText)
        XCTAssertNotNil(dataSource?.imageURL)
        XCTAssertNotNil(dataSource?.entry)
        /// Expectation fullfil
        expectation.fulfill()
        self.waitForExpectations(timeout: 5.0)
    }
    
    /// - Experiment:test NumberOfItemsInSection method with correct value
    /// - Note: Expected Result :  ProgramDataSource dataSource should not be nil
    /// - Note: As per Current mock data value should be 28. Please check implementation and mock in case of test case fail.
    func testNumberOfItemsInSection() {
        let expectation = self.expectation(description: "ProgramDataSource should not be nil")
        /// set the MovieListViewModel
        let movieListViewModel = MovieListViewModel(withMovieList: programOptionsViewModel.provideDataForMovies())
        /// data source for movie view collection cell
        let assetCount = movieListViewModel.numberOfItemsInSection()
        XCTAssertEqual(assetCount, 28)
        /// Expectation fullfil
        expectation.fulfill()
        self.waitForExpectations(timeout: 5.0)
    }
}
