//
//  WatchListDataProvider.swift
//  WatchList
//
//  Created by Animesh Mishra on 2/12/21.
//

import Foundation
import UIKit
import WatchListServices

// MARK: - MovieListViewModel
class MovieListViewModel {
    // MARK: - Public Constants
    public let movieList: [Entry]
    
    // MARK: - Internal variables
    weak var delegate: ProgramListViewModelDelegate?
    
    // MARK - Initialization
    init(withMovieList movieList: [Entry]) {
        self.movieList = movieList
    }
    
    func viewDidLoad() {
        /// If Movie list is not having data, show Alert
        if movieList.count == 0 {
            delegate?.dataNotAvailable()
        }
    }
}

// MARK: - MovieListViewModel - Extension for Collection View
extension MovieListViewModel {
    
    /// cellForItemAtIndexPathForSection - Provide data source object for the cell for the collection view.
    /// - Parameters:
    ///   - row: An index number identifying a row in collection view.
    /// - Returns: ProgramDataSource
    
    public func cellForItemAtIndexPathForSection(row: Int) -> ProgramDataSource? {
        return ProgramDataSource(entry: movieList[row])
    }
    
    /// numberOfItemsInSection - Provide number of items in the specified of the collection view.
    /// - Returns: Integer (Number of items)
    public func numberOfItemsInSection() -> Int {
        return movieList.count 
    }
    
    ///  collectionViewLayoutSize - Provide size of the specified item’s cell of collection view
    /// - Parameter collectionView: UICollectionView
    /// - Returns: CGSize
    public func collectionViewLayoutSize(_ collectionView: UICollectionView) -> CGSize {
        UIWindow.isLandscape ?
            CGSize(width: collectionView.frame.width -  32.0, height: collectionView.frame.height) :
            CGSize(width: collectionView.frame.width -  32.0, height: collectionView.frame.height / 2)
    }
}

