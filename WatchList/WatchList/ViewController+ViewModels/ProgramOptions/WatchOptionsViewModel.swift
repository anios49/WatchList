//
//  WatchOptionsViewModel.swift
//  WatchList
//
//  Created by Animesh Mishra on 2/12/21.
//

import Foundation
import WatchListServices

// MARK: - WatchOptionsViewModelDelegate
/// WatchOptionsViewModelDelegate for API success and fail handling
protocol WatchOptionsViewModelDelegate: AnyObject {
    func success()
    func failure()
}

// MARK: - WatchOptionsViewModel
public class ProgramOptionsViewModel {
    // MARK: - Public variables
    public var watchListEntries: [Entry] = []
    
    // MARK: - Internal variables
    weak var delegate: WatchOptionsViewModelDelegate?
    
    // MARK: - Public functions
    /// viewDidLoad and Setup
    func viewDidLoad() {
        requestAPI()
        
    }
    
    // MARK: - Private functions
    // fetch News data
    private func requestAPI() {
        Networking.fetchWatchList { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let watchListData):
                self.watchListEntries = watchListData.entries ?? []
//                var x = self.filterWatchListYear(enteries: self.watchListEntries ?? [], filterYear: 2010)
//                let y = self.sortWatchListAlphaNumeric(enteries: &x)
//
//                let movies = self.filterProgramType(enteries: y, filterType: ProgramType.movie.rawValue)
//                let series = self.filterProgramType(enteries: y, filterType: ProgramType.series.rawValue)
                self.delegate?.success()

            case .failure( _):
                self.delegate?.failure()
            }
        }
    }


    public func provideDataForMovies() -> [Entry] {
        let movieList = WatchListUtils().sortAndFilterWatchList(withEnteries: watchListEntries,
                                                                filterProgramType: ProgramType.movie.rawValue,
                                                                filterYear: 2010)
        return movieList
    }
    
    public func provideDataForSeries() -> [Entry] {
        let seriesList = WatchListUtils().sortAndFilterWatchList(withEnteries: watchListEntries,
                                                                 filterProgramType: ProgramType.series.rawValue,
                                                                 filterYear: 2010)
        return seriesList
    }

}



