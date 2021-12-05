//
//  MovieListViewController.swift
//  WatchList
//
//  Created by Animesh Mishra on 2/12/21.
//

import UIKit
// MARK: - MovieListViewController
class MovieListViewController: UIViewController {
    // MARK: - Public Variables
    public var movieListViewModel: MovieListViewModel?
    
    // MARK: - IBOutlets
    @IBOutlet weak var movieListCollectionView: UICollectionView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewModel()
        setupCollectionView()
    }
    
    /// SetupData for View Model
    func setupViewModel() {
        movieListViewModel?.delegate = self
        movieListViewModel?.viewDidLoad()
        activityIndicator.startAnimating()
    }
    
    /// Setup Collection View cell
    func setupCollectionView() {
        let nineNewsPointCollectionViewCell = UINib.init(nibName: Constants.ProgramCollectionViewCell,
                                                         bundle: Bundle(for: MovieListViewController.self))
        movieListCollectionView.register(nineNewsPointCollectionViewCell,
                                         forCellWithReuseIdentifier: Constants.ProgramCollectionViewCell)
        movieListCollectionView.reloadData()
    }
}

// MARK: - UICollectionViewDataSource Functions
extension MovieListViewController: UICollectionViewDataSource {
    /// Asks your data source object for the number of items in the specified section
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        movieListViewModel?.numberOfItemsInSection() ?? 0
    }
    
    /// Asks your data source object for the cell that corresponds to the specified item in the collection view.
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        ///Dequeues a reusable cell object using Reuse Identifier
        let cell = movieListCollectionView.dequeueReusableCell(withReuseIdentifier: Constants.ProgramCollectionViewCell,
                                                               for: indexPath as IndexPath) as!  ProgramCollectionViewCell
        ///Getting Cell Data sourceand settingup
        if let dataSource = movieListViewModel?.cellForItemAtIndexPathForSection(row: indexPath.row) {
            cell.setCellData(dataSource)
        }
        ///Setting Cell Border color and delegate
        cell.layer.borderColor = UIColor.getAppearanceColor(.black).cgColor
        cell.delegate = self
        return cell
    }
    
    /// Called when the iOS interface environment changes.
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        movieListCollectionView.reloadData()
    }
}

// MARK: - UICollectionViewDelegateFlowLayout Function
extension MovieListViewController: UICollectionViewDelegateFlowLayout {
    /// Asks the delegate for the size of the specified item’s cell.
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        movieListViewModel?.collectionViewLayoutSize(collectionView) ?? CGSize(width: collectionView.frame.width -  32.0, height: collectionView.frame.height)
    }
}

// MARK: - NineNewsPointCollectionViewCellDelegate Functions
extension MovieListViewController: ProgramCollectionViewCellDelegate {
    /// Share Button Action handler
    /// - Parameters:
    ///   - title: String
    ///   - titleDescription: String
    func buttonAction(title: String, titleDescription: String) {
        let items:[Any] = [String(format: Constants.ShareText,title) + Constants.LineSpace + titleDescription]
        let ac = UIActivityViewController(activityItems: items, applicationActivities: nil)
        self.present(ac, animated: true)
    }
}


// MARK: - ProgramListViewModelDelegate Functions
extension MovieListViewController: ProgramListViewModelDelegate {
    func dataNotAvailable() {
        self.showAlertWithOneButton(title: Constants.ErrorTitle,
                                    message: String(format: Constants.ErrorMessage, Constants.Movies),
                                    buttonTitle: Constants.ErrorOk)
    }
}
