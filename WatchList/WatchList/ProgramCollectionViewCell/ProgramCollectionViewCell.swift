//
//  ProgramCollectionViewCell.swift
//  WatchList
//
//  Created by Animesh Mishra on 2/12/21.
//

import UIKit
// MARK: ProgramCollectionViewCell
class ProgramCollectionViewCell: UICollectionViewCell {
    // MARK: - IBOutlets
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var titleDescription: UILabel!
    @IBOutlet weak var releaseYear: UILabel!
    @IBOutlet weak var cellWidthConstraintConstant: NSLayoutConstraint!
    
    // MARK: - Variables
    weak var delegate: ProgramCollectionViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        /// Labels color setup
        title.textColor = UIColor.getAppearanceColor(.black)
        titleDescription.textColor = UIColor.getAppearanceColor(.black)
        releaseYear.textColor = UIColor.getAppearanceColor(.gray)
    }
    
    /// Set custom cell & lables data
    /// - Parameter programDataSource: ProgramDataSource
    func setCellData(_ programDataSource: ProgramDataSource) {
        title.text = programDataSource.titleLabelText
        titleDescription.text = programDataSource.titleDescriptionLabelText
        releaseYear.text = programDataSource.releaseYearLabelText
        image.loadImage(urlSting: programDataSource.imageURL ?? Constants.BlankString)
        
        /// Cell width setup using Constraint Constant
        cellWidthConstraintConstant.constant = UIWindow.isLandscape ? UIScreen.main.bounds.width - 96 : UIScreen.main.bounds.width - 16
    }
    
    
    /// Share Program details Action
    /// - Parameter sender: Object that sent the action message
    @IBAction func shareButton(_ sender: Any) {
        delegate?.buttonAction(title: title.text ?? Constants.BlankString,
                               titleDescription: titleDescription.text ?? Constants.BlankString)
    }
    
}
