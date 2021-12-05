//
//  WatchListServicesTests.swift
//  WatchListServicesTests
//
//  Created by Animesh Mishra on 2/12/21.
//

import XCTest
@testable import WatchListServices

class WatchListServicesTests: XCTestCase {
    
    static let imageURL = "https://streamcoimg-a.akamaihd.net/000/124/31/12431-PosterArt-f7d91329c70a7fa206e838423caa31bd.jpg"
    
    /// Unit Test for GetWatchList
    /// - Experiment:Testing URL to get the response
    /// - Note: Expected Result : data should not be nil
    /// - Note: Response wait time should be 5 seconds.
    func testGetWatchList() {
        // Put the code you want to measure the time of here.
        let expectation = self.expectation(description: "Get WatchList service is received successfully")
        Networking.fetchWatchList { result in
            switch result {
            case .success(let data):
                XCTAssertNotNil(data)
                expectation.fulfill()
            default:
                XCTFail("Expected get WatchList service response with error json")
            }
        }
        self.waitForExpectations(timeout: 5.0)
    }
    
    /// Unit Test for GetWatchList
    /// - Experiment:Testing failure scenarios
    /// - Note: Expected Result : data should be nil
    /// - Note: Response wait time should be 5 seconds.
    func ttestGetWatchListError() {
        let expectation = self.expectation(description: "Get WatchList is not working")
        Networking.fetchWatchList(shouldFail: true) { result in
            switch result {
            case .failure(let error):
                XCTAssertNotNil(error)
                expectation.fulfill()
            default:
                XCTFail("Expected get WatchList service response with error json")
            }
        }
        self.waitForExpectations(timeout: 5.0)
    }
    
    /// Unit Test for Request Image Data
    /// - Experiment:Testing Image from Server
    /// - Note: Expected Result : data should not be nil (Please check the WatchListServicesTests.imageURL on browser, if test get failed)
    /// - Note: Response wait time should be 5 seconds.
    func testRequestImageData() {
        let expectation = self.expectation(description: "Get RequestImageData is working fine")
        guard let url = URL(string: WatchListServicesTests.imageURL) else { return }
        
        networking.requestImageData(url: url) {(result) in
            switch result {
            case .success(let data):
                XCTAssertNotNil(data)
                expectation.fulfill()
            default:
                XCTFail("Expected get RequestImageData response with error json")
            }
        }
        self.waitForExpectations(timeout: 5.0)
    }
    
    /// Unit Test for Load Image (extension)
    /// - Experiment:loading Image from Server
    /// - Note: Expected Result : image should have value in pngData (Please check the WatchListServicesTests.imageURL on browser, if test get failed)
    /// - Note: Response wait time should be 5 seconds.
    func testLoadImage() {
        let expectation = self.expectation(description: "LoadImage is working fine with Valid URL")
        let imageView = UIImageView()
        imageView.loadImage(urlSting: WatchListServicesTests.imageURL)
        let result = XCTWaiter.wait(for: [expectation], timeout: 5.0)
        if result == XCTWaiter.Result.timedOut {
            XCTAssertNotNil(imageView.image?.pngData())
            expectation.fulfill()
        } else {
            XCTFail("Delay interrupted")
        }
    }
    
    /// Unit Test for Load Image (extension)
    /// - Experiment:loading Image from Server Error
    /// - Note: Expected Result : image pngData value will be nil (Please check the WatchListServicesTests.imageURL on browser, if test get failed)
    /// - Note: Response wait time should be 5 seconds.
    func testLoadImageError() {
        let expectation = self.expectation(description: "LoadImage is not working fine with Invalid URL")
        let imageView = UIImageView()
        imageView.loadImage(urlSting:"")
        let result = XCTWaiter.wait(for: [expectation], timeout: 5.0)
        if result == XCTWaiter.Result.timedOut {
            XCTAssertNil(imageView.image?.pngData())
            expectation.fulfill()
        } else {
            XCTFail("Delay interrupted")
        }
    }

}
