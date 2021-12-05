//
//  programOptionsViewModel.swift
//  WatchList
//
//  Created by Animesh Mishra on 2/12/21.
//

import Foundation
import WatchListServices

// MARK: - ProgramOptionsViewModel
public class ProgramOptionsViewModel {
    // MARK: - Public variables
    public var watchListEntries: [Entry] = []
    
    // MARK: - Internal variables
    weak var delegate: ProgramOptionsViewModelDelegate?
    
    // MARK: - Public functions
    /// viewDidLoad and Setup
    func viewDidLoad() {
        requestAPI()
        
    }
    
    // MARK: - Private functions
    // fetch News data
    public func requestAPI() {
        Networking.fetchWatchList { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let watchListData):
                self.watchListEntries = watchListData.entries ?? []
                self.delegate?.success()

            case .failure( _):
                self.delegate?.failure()
            }
        }
    }

    
    /// Provide Filtered and Sorted data for Movies
    /// - Returns: filtered data
    public func provideDataForMovies() -> [Entry] {
        let movieList = WatchListUtils().sortAndFilterWatchList(withEnteries: watchListEntries,
                                                                filterProgramType: ProgramType.movie.rawValue,
                                                                filterYear: 2010)
        return movieList
    }
    
    /// Provide Filtered and Sorted data for Series
    /// - Returns: filtered data
    public func provideDataForSeries() -> [Entry] {
        let seriesList = WatchListUtils().sortAndFilterWatchList(withEnteries: watchListEntries,
                                                                 filterProgramType: ProgramType.series.rawValue,
                                                                 filterYear: 2010)
        return seriesList
    }

}



