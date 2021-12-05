//
//  Protocols.swift
//  WatchList
//
//  Created by Animesh Mishra on 5/12/21.
//

import Foundation
// MARK: - ProgramListViewModelDelegate
/// ProgramListViewModelDelegate for no data cases handling
protocol ProgramListViewModelDelegate: AnyObject {
    func dataNotAvailable()
}

// MARK: - ProgramOptionsViewModelDelegate
/// programOptionsViewModelDelegate for API success and fail handling
protocol ProgramOptionsViewModelDelegate: AnyObject {
    func success()
    func failure()
}
