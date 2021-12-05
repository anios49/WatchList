//
//  Entry.swift
//  WatchList
//
//  Created by Animesh Mishra on 2/12/21.
//

import Foundation

// MARK: - Entry
public struct Entry: Codable{
    public let title, description: String
    public let programType: ProgramType?
    public let images: Images?
    public let releaseYear: Int
}

// MARK: - ProgramType
public enum ProgramType: String, Codable {
    case movie = "movie"
    case series = "series"
}

// MARK: - Entry Extension for comparable protocol
extension Entry: Comparable {
    public static func == (lhs: Entry, rhs: Entry) -> Bool {
        return lhs.title == rhs.title
    }
    
    public static func < (lhs: Entry, rhs: Entry) -> Bool {
        return lhs.title < rhs.title
    }
}
