//
//  ProgramDataSource.swift
//  WatchList
//
//  Created by Animesh Mishra on 2/12/21.
//

import Foundation
import WatchListServices

// MARK: - ProgramDataSource
public class ProgramDataSource: ProgramCollectionViewCellDataSource {
    // MARK: - Public Variables
    public var imageURL: String? {
        entry?.images?.posterArt?.url
    }
    
    public var titleLabelText: String? {
        entry?.title
    }
    
    public var titleDescriptionLabelText: String? {
        entry?.description
    }
    
    public var releaseYearLabelText: String? {
        String(entry?.releaseYear ?? 0)
    }
    
    ///News Article List
    public let entry: Entry?
    
    // MARK: Public Intializer
    /// ProgramDataSource
    /// - Parameters:
    ///   - entry: Entry
    public init(entry: Entry?) {
        self.entry = entry
    }
    
}
