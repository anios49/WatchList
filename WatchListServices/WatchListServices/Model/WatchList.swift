//
//  WatchList.swift
//  WatchList
//
//  Created by Animesh Mishra on 2/12/21.
//

import Foundation

// MARK: - WatchList
public struct WatchList: Codable {
    public let total: Int?
    public let entries: [Entry]?
}
