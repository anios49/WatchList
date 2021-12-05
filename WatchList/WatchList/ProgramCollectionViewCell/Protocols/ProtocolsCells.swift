//
//  Protocols.swift
//  WatchList
//
//  Created by Animesh Mishra on 5/12/21.
//

import Foundation

// MARK: ProgramCollectionViewCell Data Source Protocol
public protocol ProgramCollectionViewCellDataSource {
    var imageURL:String? { get }
    var titleLabelText:String? { get }
    var titleDescriptionLabelText:String? { get }
    var releaseYearLabelText:String? { get }
}

// MARK: ProgramCollectionViewCell Delegate Protocol
public protocol ProgramCollectionViewCellDelegate: class {
    func buttonAction(title:String, titleDescription:String)
}
