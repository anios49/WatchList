//
//  ProgramOptionsViewController.swift
//  WatchList
//
//  Created by Animesh Mishra on 2/12/21.
//

import UIKit
// MARK: - ProgramOptionsViewController
class ProgramOptionsViewController: UIViewController {
    // MARK: - Private Variables
    private var programOptionsViewModel = ProgramOptionsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = Constants.ProgramOptions
        setupViewModel()
    }
    
    /// Setup ProgramOptionsViewModel ViewModel
    func setupViewModel() {
        programOptionsViewModel.delegate = self
        programOptionsViewModel.viewDidLoad()
    }
    
    /// Prepare for segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Constants.MovieListIdentifier {
            /// Navigation to Movie List View Controller
            guard let movieListVC = segue.destination as? MovieListViewController else { return }
            movieListVC.navigationItem.title = Constants.MovieTitle
            movieListVC.movieListViewModel = MovieListViewModel(withMovieList: programOptionsViewModel.provideDataForMovies())
        } else if segue.identifier == Constants.SeriesListIdentifier {
            /// Navigation to Series List View Controller
            guard let seriesListVC = segue.destination as? SeriesListViewController else { return }
            seriesListVC.navigationItem.title = Constants.SeriesTitle
            seriesListVC.seriesListViewModel = SeriesListViewModel(withSeriesList: programOptionsViewModel.provideDataForSeries())
        }
    }
    
    /// Movie Button Action
    @IBAction func movieButtonAction(_ sender: Any) {
        if !isdataModelEmpty() {
            performSegue(withIdentifier: Constants.MovieListIdentifier, sender: self)
        }
    }
    
    /// Series Button Action
    @IBAction func seriesButtonAction(_ sender: Any) {
        if !isdataModelEmpty() {
            performSegue(withIdentifier: Constants.SeriesListIdentifier, sender: self)
        }
    }
    
    /// Check DataModel have data or not, if data is not present show alert
    /// - Returns: Bool result
    func isdataModelEmpty() -> Bool {
        if programOptionsViewModel.watchListEntries.count == 0 {
            showErrorAlert()
            return true
        } else {
            return false
        }
    }
    
    
    /// showAlert
    func showErrorAlert() {
        self.showAlert(title: Constants.ErrorTitle,
                       message: String(format: Constants.ErrorMessage, Constants.Programs),
                       cancelButtonTitle: Constants.ErrorOk,
                       alertAction: UIAlertAction(title: Constants.ErrorRetry,
                                                  style: UIAlertAction.Style.default) { UIAlertAction in
                        self.dismiss(animated: true, completion: nil)
                        self.programOptionsViewModel.viewDidLoad()
                       })
    }
}

// MARK: - Extension ProgramOptionsViewModelDelegate
extension ProgramOptionsViewController: ProgramOptionsViewModelDelegate {
    func success() {
        /// Success handling for fututre to extend functionalities
    }
    
    func failure() {
        showErrorAlert()
    }
}
