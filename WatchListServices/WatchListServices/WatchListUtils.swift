//
//  WatchListUtils.swift
//  WatchListServices
//
//  Created by Animesh Mishra on 2/12/21.
//

import Foundation

public class WatchListUtils {
    private var processedEnteries: [Entry] = []
    
    public init() {
        
    }
    
    /// Filter the Entry list using programType parameter
    /// - Parameters:
    ///   - enteries: list of Entry, which needs to filter out
    ///   - programType: filter programType
    /// - Returns: filtered enteries list
    public func filterProgramType(withEnteries enteries:[Entry], filterProgramType programType: String) -> [Entry] {
        ///filter program type
        return enteries.filter { $0.programType?.rawValue == programType }
    }
    
    /// Filter the Entry list using filter release year, and return Entry list equal or higher year data
    /// - Parameters:
    ///   - enteries: list of Entry, which needs to filter out
    ///   - year: filter release year
    /// - Returns: filtered enteries list
    public func filterWatchListYear(withEnteries enteries:[Entry], filterReleaseYear year: Int) -> [Entry] {
        ///only display entries with releaseYear >= filterYear (i.e. 2010)
        return enteries.filter { $0.releaseYear >= year }
    }
    
    /// Sort Watch List Alphanumeric
    /// - Parameter enteries: list of Entry, which needs to sort
    /// - Returns: sorted enteries list
    public func sortWatchListAlphaNumeric(withEnteries enteries: [Entry]) -> [Entry] {
        ///sort by title in ascending alphanumeric order.
        let sortedArray = enteries.sorted {
            $0.title.compare($1.title, options: .numeric) == .orderedAscending
        }
        return sortedArray
    }
    
    /// Sort Entry list Alphanumeric and Filter the same, using filter release date and filter program type
    /// - Parameters:
    ///   - enteries: list of Entry, which needs to sort and filter
    ///   - programType: filter programType
    ///   - year: filter release year
    /// - Returns: filtered and sorted enteries list
    public func sortAndFilterWatchList(withEnteries enteries:[Entry], filterProgramType programType: String, filterYear year: Int) -> [Entry] {
        processedEnteries = filterProgramType(withEnteries: enteries, filterProgramType: programType)
        processedEnteries = filterWatchListYear(withEnteries: processedEnteries, filterReleaseYear: year)
        processedEnteries = sortWatchListAlphaNumeric(withEnteries: processedEnteries)
        return processedEnteries
    }
}
