//
//  SeriesListViewModel.swift
//  WatchList
//
//  Created by Animesh Mishra on 2/12/21.
//

import Foundation
import UIKit
import WatchListServices

// MARK: - MovieListViewModelDelegate
class SeriesListViewModel {
    // MARK: - Public Constants
    let seriesList: [Entry]
    // MARK: - Internal variables
    weak var delegate: ProgramListViewModelDelegate?
    
    // MARK - Initialization
    init(withSeriesList seriesList: [Entry]) {
        self.seriesList = seriesList
    }
    
    func viewDidLoad() {
        /// If Series list is not having data, show Alert
        if seriesList.count == 0 {
            delegate?.dataNotAvailable()
        }
    }
}

// MARK: - SeriesListViewModel - Extension for Collection View
extension SeriesListViewModel {
    
    /// cellForItemAtIndexPathForSection - Provide data source object for the cell for the collection view.
    /// - Parameters:
    ///   - row: An index number identifying a row in collection view.
    /// - Returns: ProgramDataSource
    public func cellForItemAtIndexPathForSection(row: Int) -> ProgramDataSource? {
        return ProgramDataSource(entry: seriesList[row])
    }
    
    /// numberOfItemsInSection - Provide number of items in the specified of the collection view.
    /// - Returns: Integer (Number of items)
    public func numberOfItemsInSection() -> Int {
        return seriesList.count
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

