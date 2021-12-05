//
//  XCTest+JSON.swift
//  WatchListTests
//
//  Created by Animesh Mishra on 5/12/21.
//

import Foundation
import XCTest

extension XCTestCase {
    /// Get a top-level value of the given type from the given local JSON file
    /// - Parameter fileName: Local File Name
    /// - Returns: Data in model representation
    func getData<T: Decodable>(fromJSON fileName: String) throws -> T {
        guard let pathString = Bundle(for: type(of: self)).path(forResource: fileName, ofType: "json") else {
            fatalError("UnitTestData.json not found")
        }
        
        guard let jsonString = try? String(contentsOfFile: pathString, encoding: .utf8) else {
            fatalError("Unable to convert UnitTestData.json to String")
        }
                
        guard let jsonData = jsonString.data(using: .utf8) else {
            fatalError("Unable to convert UnitTestData.json to Data")
        }
        
        let decoder = JSONDecoder()
        let decodedData = try! decoder.decode(T.self, from: jsonData)
        return decodedData
    }
}
