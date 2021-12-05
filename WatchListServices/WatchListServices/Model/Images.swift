//
//  Images.swift
//  WatchList
//
//  Created by Animesh Mishra on 2/12/21.
//

import Foundation

// MARK: - Images
public struct Images: Codable {
    public let posterArt: PosterArt?

    enum CodingKeys: String, CodingKey {
        case posterArt = "Poster Art"
    }
}
